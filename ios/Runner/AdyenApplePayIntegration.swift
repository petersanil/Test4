//
//  AdyenApplePayIntegration.swift
//  Runner
//
//  Created by Anchal Singh on 30/10/23.
//

import Foundation
import Flutter
import UIKit
import Adyen
import PassKit

public class AdyenApplePayIntegration: NSObject, FlutterPlugin, AdyenSessionDelegate, PresentationDelegate {
    var session: Adyen.AdyenSession?
    var applePayComponent : ApplePayComponent?
    var flutterEngine: FlutterEngine?
    var adyenEnviroment: Environment?
    var flutterResult: FlutterResult?
    var paymentViewController: UIViewController?
    
    
    // When Apple pay shown to users
    public func present(component: Adyen.PresentableComponent) {
//        print("Adyen : Payment present")
    }
   
    // When payments completes
    public func didComplete(with result: Adyen.AdyenSessionResult, component: Adyen.Component, session: Adyen.AdyenSession) {
//        print("Adyen : Payment completes \(result.resultCode)")
        if(self.paymentViewController!.isViewLoaded){
            self.paymentViewController!.dismiss(animated: true, completion: nil)
        }
        if(result.resultCode == SessionPaymentResultCode.authorised || result.resultCode == SessionPaymentResultCode.received){
            flutterResult!("authorised")
        } else if(result.resultCode == SessionPaymentResultCode.cancelled){
            flutterResult!(FlutterError(code: "error", message: "Payment has been cancelled, please try again", details: "Payment cancelled"))
        } else if(result.resultCode == SessionPaymentResultCode.error){
            flutterResult!(FlutterError(code: "error", message: "Payment failed, please try again", details: "Payment error"))
        }else if(result.resultCode == SessionPaymentResultCode.pending){
            flutterResult!("pending")
        }else if(result.resultCode == SessionPaymentResultCode.presentToShopper){
            flutterResult!(FlutterError(code: "error", message: "Payment failed, please try again", details: "Payment presentToShopper"))
        }else if(result.resultCode == SessionPaymentResultCode.refused){
            flutterResult!(FlutterError(code: "error", message: "Payment refused, please try again", details: "Payment refused"))
        }
       
        
    }
    
    // When payments fails
    public func didFail(with error: Error, from component: Adyen.Component, session: Adyen.AdyenSession) {
//        print("Adyen : didFail \(error.localizedDescription)")
        if(self.paymentViewController!.isViewLoaded){
            self.paymentViewController!.dismiss(animated: true, completion: nil)
        }
        flutterResult!(FlutterError(code: "error", message: "Payment cancelled, please try again", details: error.localizedDescription))
    }
    
    // When an action required
    public func didOpenExternalApplication(component: Adyen.ActionComponent, session: Adyen.AdyenSession) {
//        print("Adyen : Payment didOpenExternalApplication")
        if(paymentViewController!.isViewLoaded){
            self.paymentViewController!.dismiss(animated: true, completion: nil)
        }
        flutterResult!(FlutterError(code: "error", message: "Payment failed, please try again later", details: "Payment didOpenExternalApplication action required"))
    }
    
    public func handlerForPayments(in component: Adyen.PaymentComponent, session: Adyen.AdyenSession) -> Adyen.AdyenSessionPaymentsHandler? {
        return nil
    }
    
    public func handlerForAdditionalDetails(in component: Adyen.ActionComponent, session: Adyen.AdyenSession) -> Adyen.AdyenSessionPaymentDetailsHandler? {
        return nil
    }
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        
        let channel = FlutterMethodChannel(name: "adyen_payments", binaryMessenger: registrar.messenger())

        let instance = AdyenApplePayIntegration()
        instance.flutterEngine = (registrar as? FlutterViewController)?.engine
    
        
        registrar.addMethodCallDelegate(instance, channel: channel)
        
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        self.flutterResult = result;
        if call.method == "applePayPayments" {
            if let arguments = call.arguments as? [String: Any], let sessionArguments = arguments as? [String: Any] {
                
                do{
                    let jsonSessionData = sessionArguments["sessionData"] as? [String:Any]
                    let totalAmount = (sessionArguments["totalAmount"] as? Double)!
                    let environment = (sessionArguments["environment"] as? String)!
                    let merchantId = (sessionArguments["merchantIdentifier"] as? String)!
                    let adyenKey = (sessionArguments["adyenKey"] as? String)!
                    
                    if(environment == "live"){
                        adyenEnviroment = Environment.liveApse
                    } else {
                        adyenEnviroment = Environment.test
                    }
                    
                    let createSessionData = jsonSessionData?["createSessionData"] as? [String:Any]
                    let sessionId = createSessionData?["id"] as! String
                    let sessionData = createSessionData?["sessionData"] as! String
                    let sessionAmount = createSessionData?["amount"] as? [String: Any]
                    let currency = sessionAmount?["currency"] as? String
                    let sessionValue = sessionAmount?["value"] as? Int
//                    print("CreateSessionData : \(sessionData as AnyObject)")
//                    print("SessionID : \(sessionId)")
//                    print("SessionData : \(sessionData)")
//                    print("SessionAmount : \(String(describing: sessionValue))")
//                    print("SessionCurrency : \(String(describing: currency))")
                    // Set the client key and environment in an instance of APIContext.
                    AdyenLogging.isEnabled = true
                    let apiContext = try APIContext(environment: adyenEnviroment ?? Environment.test, clientKey:adyenKey) // Set the environment to a live one when going live.
                    
                    // Create the amount with the value in minor units and the currency code.
                    let amount = Amount(value: sessionValue!,currencyCode: currency!)
                    // Create the payment object with the amount and country code.
                    let payment = Payment(amount: amount, countryCode: "AE")
                    // Create an instance of AdyenContext, passing the instance of APIContext, payment object, and optional analytics configuration.
                    let adyenContext = AdyenContext(apiContext: apiContext, payment:payment)
                    
                    let configuration = AdyenSession.Configuration(sessionIdentifier: sessionId, initialSessionData: sessionData, context: adyenContext)
                    
                    AdyenSession.initialize(with: configuration, delegate: self, presentationDelegate: self) { [weak self] res in
                        switch res {
                        case let .success(session):
                            //Store the session object.
                            self?.session = session
                            self?.presentComponent(with: session, adyenContext: adyenContext,totalAmount:totalAmount, merchantId: merchantId)
                        case let .failure(error):
                            result(FlutterError(code: "error", message: "Payment failed, please try again", details: "Failed to initialize adyen session"))
                            //Handle the error.
                        }
                    }
                    
                } catch{
                    result(FlutterError(code: "error", message: "Payment failed, please try again", details: error.localizedDescription))

                }
            } else {
                result(FlutterError(code: "error", message: "Payment failed, please try again", details: nil))

            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    internal func presentComponent(with session: AdyenSession, adyenContext : AdyenContext, totalAmount: Double, merchantId: String) {
        do {
//            print("TOTALAMOUNT : \(totalAmount)")
            var amount = NSDecimalNumber(decimal: Decimal(totalAmount))

            //Create a payment method object for Apple Pay.
            guard let paymentMethods = self.session?.sessionContext.paymentMethods,
                  let paymentMethod = paymentMethods.paymentMethod(ofType: ApplePayPaymentMethod.self) else { return }
            
            //Create a configuration object for the Apple Pay Component.
            let applePayPayment = try ApplePayPayment(countryCode: "AE", currencyCode: "AED", summaryItems: [
                PKPaymentSummaryItem(label: "Add-Ons", amount: amount)
            ])
            var ApplePayComponentConfiguration = ApplePayComponent.Configuration(payment: applePayPayment, merchantIdentifier: merchantId)
            ApplePayComponentConfiguration.allowOnboarding = true
            ApplePayComponentConfiguration.requiredBillingContactFields = [ .name, .emailAddress]
            ApplePayComponentConfiguration.requiredShippingContactFields = [.name, .emailAddress, .phoneNumber]
            
            let paymentComponent = try ApplePayComponent(paymentMethod: paymentMethod, context: adyenContext, configuration: ApplePayComponentConfiguration)
            paymentComponent.delegate = session
            self.applePayComponent = paymentComponent
            self.present(component: paymentComponent)
            DispatchQueue.main.async {
                self.paymentViewController = paymentComponent.viewController // Replace with your view controller
                UIApplication.shared.keyWindow?.rootViewController?.present(self.paymentViewController!, animated: true, completion: nil);
            }
            
        } catch {
//            print("Adyen : error \(error)")
            if(paymentViewController!.isViewLoaded){
                self.paymentViewController!.dismiss(animated: true, completion: nil)
            }
            flutterResult!(FlutterError(code: "error", message: "Payment failed, please try again", details: error.localizedDescription))
        }
    }
}


