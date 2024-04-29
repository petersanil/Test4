package com.atlantis.aquaventure

import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import androidx.lifecycle.lifecycleScope
import com.adyen.checkout.components.core.Amount
import com.adyen.checkout.components.core.ComponentAvailableCallback
import com.adyen.checkout.components.core.ComponentError
import com.adyen.checkout.components.core.PaymentMethod
import com.adyen.checkout.components.core.PaymentMethodTypes
import com.adyen.checkout.components.core.action.Action
import com.adyen.checkout.core.Environment
import com.adyen.checkout.googlepay.GooglePayComponent
import com.adyen.checkout.googlepay.GooglePayComponentState
import com.adyen.checkout.googlepay.GooglePayConfiguration
import com.adyen.checkout.sessions.core.CheckoutSession
import com.adyen.checkout.sessions.core.CheckoutSessionProvider
import com.adyen.checkout.sessions.core.CheckoutSessionResult
import com.adyen.checkout.sessions.core.SessionComponentCallback
import com.adyen.checkout.sessions.core.SessionModel
import com.adyen.checkout.sessions.core.SessionPaymentResult


import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine

import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.async
import kotlinx.coroutines.launch
import org.json.JSONObject


class MainActivity : FlutterFragmentActivity(), ComponentAvailableCallback,
    SessionComponentCallback<GooglePayComponentState> {
    private val CHANNEL = "adyen_payments"
    private lateinit var checkoutSession: CheckoutSession
    private lateinit var checkoutSessionResult: CheckoutSessionResult
    private lateinit var googlePayConfig: GooglePayConfiguration
    private lateinit var googlePayComponent: GooglePayComponent
    private lateinit var flutterResult: MethodChannel.Result
    private final val GOOGLE_PAY_REQUEST_CODE = 1;

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            this.flutterResult = result
            // This method is invoked on the main thread.
            if (call.method == "googlePayPayments") {
                val sessionData = call.argument<Map<String, Any>>("sessionData");
                val environment = call.argument<String>("environment");
                val adyenKey = call.argument<String>("adyenKey");

                val response = sessionData?.let {
                    initPayment(it, adyenKey!!, environment!!)
                }
                //  result.success(response)
            } else {
                result.notImplemented();
            }

        }
    }

    private fun initPayment(
        map: Map<String, Any>,
        adyenKey: String,
        environment: String
    ): Unit {
        lifecycleScope.launch {
            googlePayPayments(map, adyenKey, environment)
            // result.success(response)
        }
    }

    suspend fun googlePayPayments(
        map: Map<String, Any>,
        adyenKey: String,
        environment: String
    ) {


     //   AdyenLogger.setLogLevel(2);
        val sessionJson = JSONObject(map)
        val jsonString = sessionJson.toString()
        // Optional. In this example, the amount is EUR&nbsp;10.
        val createSessionJson = sessionJson.getJSONObject("createSessionData")
        val sessionDataObject = createSessionJson.getString("sessionData")
        val amountJson = createSessionJson.getJSONObject("amount")

        val amount = Amount()
        amount.currency = amountJson.getString("currency")
        amount.value = amountJson.getLong("value")

        googlePayConfig = GooglePayConfiguration.Builder(
            context = applicationContext,
            environment =if( environment == "live") Environment.APSE else Environment.TEST,
            clientKey = adyenKey
        )
            .setAmount(amount)
            .build()

        val sessionModel = SessionModel.SERIALIZER.deserialize(createSessionJson)

        // Create an object for the checkout session.
        checkoutSessionResult = CheckoutSessionProvider.createSession(sessionModel, googlePayConfig)


        if (checkoutSessionResult is CheckoutSessionResult.Success) {
            checkoutSession =
                (checkoutSessionResult as CheckoutSessionResult.Success).checkoutSession
            val paymentMethod = checkoutSession.getPaymentMethod(PaymentMethodTypes.GOOGLE_PAY)
            checkGooglePayAvailability(paymentMethod!!, googlePayConfig)
        } else {
//                Log.d("ERROR", (checkoutSessionResult as CheckoutSessionResult.Error).exception.toString())
            flutterResult.error("ERROR", "Payment failed, please try again", "${(checkoutSessionResult as CheckoutSessionResult.Error).exception.message}")
        }
    }

    private fun checkGooglePayAvailability(
        paymentMethod: PaymentMethod,
        googlePayConfig: GooglePayConfiguration
    ) {
        GooglePayComponent.PROVIDER.isAvailable(application, paymentMethod, googlePayConfig, this)
    }
//
//    private suspend fun getSessionResult(
//        sessionModel: SessionModel,
//        googlePayConfig: GooglePayConfiguration
//    ): CheckoutSessionResult {
//
//        val deffered = lifecycleScope.async {
//            return@async CheckoutSessionProvider.createSession(sessionModel, googlePayConfig)
//        }
//        return deffered.await()
//    }

    override fun onAvailabilityResult(isAvailable: Boolean, paymentMethod: PaymentMethod) {
        try {
            if (isAvailable) {
                createGooglePayComponent(paymentMethod)
            } else {
                flutterResult.error("ERROR", "Google Pay is not available", null)
            }
        } catch (e: Exception) {
            flutterResult.error("ERROR", "Google Pay is not available", null)
        }
    }

    private fun createGooglePayComponent(paymentMethod: PaymentMethod) {
        googlePayComponent = GooglePayComponent.PROVIDER.get(
            activity = this,
            checkoutSession = checkoutSession,
            paymentMethod = paymentMethod,
            configuration = googlePayConfig,
            componentCallback = this,
            key = "",
        )

        googlePayComponent.startGooglePayScreen(
            activity = this,
            requestCode = GOOGLE_PAY_REQUEST_CODE
        )
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == GOOGLE_PAY_REQUEST_CODE) {
            googlePayComponent.handleActivityResult(resultCode, data)
        }
    }

    override fun onAction(action: Action) {
        flutterResult.error("ERROR", "Payment failed, please try again later", "Payment action required")
    }

    override fun onError(componentError: ComponentError) {
        Log.d("ANDROIDSESSIONDATA ERROR", componentError.errorMessage)
        flutterResult.error("ERROR", "Payment failed, please try again", componentError.errorMessage)

    }

    override fun onFinished(result: SessionPaymentResult) {
        Log.d("ANDROIDSESSIONDATA RESULT", result.toString())
        if(result.resultCode == "Authorised"){
            flutterResult.success("SUCCESS")
            return
        } else if(result.resultCode?.lowercase() == "pending"){
            flutterResult.success("pending")
            return
        } else {
            flutterResult.error("ERROR", result.resultCode, "Payment ${result.resultCode}")
        }

    }
}