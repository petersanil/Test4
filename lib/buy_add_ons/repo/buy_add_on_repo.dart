import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aquaventure/buy_add_ons/models/buy_add_on_models.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/core/app_exceptions.dart';
import 'package:aquaventure/utils/helper.dart';

class BuyAddOnRepo {
  Future<List<BuyAddOnModels>> getEntitlementsList() async {
    try {
      String query = '''
query MyQuery2 {
  listEntitlementsPurchase {
    entitlements {
      currency
      description
      eventId
      iconUrl
      name
      plu
      price
      sectionId
      status
      statusDescription
    }
    msg
    result
  }
}
''';
      Helper.printLog("Request : $query");
      final request = GraphQLRequest<String>(document: query);
      final response = await Amplify.API.query(request: request).response;
      if (!response.hasErrors && response.data != null) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.data.toString());
        Helper.printLog(jsonResponse.toString());
        if (jsonResponse['listEntitlementsPurchase'] != null) {
          if(jsonResponse['listEntitlementsPurchase']['result'] == "SUCCESS"){
            var jsonList = jsonResponse['listEntitlementsPurchase']['entitlements'] as List;
            List<BuyAddOnModels> model = jsonList.map((e) => BuyAddOnModels.fromJson(e)).toList();
            return model;
          } else
          {
            throw AppException(message: jsonResponse['listEntitlementsPurchase']['msg']);
          }

        } else {
          throw AppException(message: AppConstants.ADD_ON_ERROR);
        }
      }
      throw AppException(message: AppConstants.ADD_ON_ERROR);
    } on ApiException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.ADD_ON_ERROR);
    } on AppException catch (e) {
      throw AppException(message: e.message);
    } catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog("Error : ${e.toString()}");
      throw AppException(message: AppConstants.ADD_ON_ERROR);
    }
  }

  ///May be utilised in future to hold & unhold the items

//   Future<int?> holdItems({required BuyAddOnModels model, required int quantity, int? orderId}) async {
//     try {
//       String query = '''
// mutation MyMutation {
//   entitlementHold(eventId: ${model.eventId}, plu: "${model.plu}", pluDescription: "${model.plu}", price: ${model.price}, quantity: $quantity, sectionID: ${model.sectionId}, sessionId: $orderId) {
//     msg
//     result
//     orderId
//   }
// }
// ''';
//       Helper.printLog("Request : $query");
//       final request = GraphQLRequest<String>(document: query);
//       final response = await Amplify.API.query(request: request).response;
//       if (!response.hasErrors && response.data != null) {
//         Map<String, dynamic> jsonResponse = jsonDecode(response.data.toString());
//         Helper.printLog(jsonResponse.toString());
//         if (jsonResponse['entitlementHold'] != null) {
//           if(jsonResponse['entitlementHold']['result'] == "SUCCESS"){
//             return jsonResponse['entitlementHold']['orderId'];
//           } else {
//             throw AppException(message: jsonResponse['entitlementHold']['msg']);
//           }
//
//         } else {
//           throw AppException(message: AppConstants.HOLD_ITEM_ERROR);
//         }
//       }
//       throw AppException(message: AppConstants.HOLD_ITEM_ERROR);
//     } on ApiException catch (e, stacktrace) {
//       Helper.captureException(e, stacktrace);
//       throw AppException(message: AppConstants.HOLD_ITEM_ERROR);
//     } on AppException catch (e) {
//       throw AppException(message: e.message);
//     } catch (e, stacktrace) {
//       Helper.captureException(e, stacktrace);
//       Helper.printLog("Error : ${e.toString()}");
//       throw AppException(message: AppConstants.HOLD_ITEM_ERROR);
//     }
//   }
//
//
//   Future<bool> unholdItems({required BuyAddOnModels model, required int quantity,required  int orderId}) async {
//     try {
//       String query = '''
// mutation MyMutation {
//   entitlementUnHold(eventId: ${model.eventId}, quantity: $quantity, sectionID: ${model.sectionId}, orderId: $orderId) {
//     msg
//     result
//   }
// }
// ''';
//       Helper.printLog("Request : $query");
//       final request = GraphQLRequest<String>(document: query);
//       final response = await Amplify.API.query(request: request).response;
//       if (!response.hasErrors && response.data != null) {
//         Map<String, dynamic> jsonResponse = jsonDecode(response.data.toString());
//         Helper.printLog(jsonResponse.toString());
//         if (jsonResponse['entitlementUnHold'] != null) {
//           if(jsonResponse['entitlementUnHold']['result'] == "SUCCESS"){
//             return true;
//           } else {
//             throw AppException(message: jsonResponse['entitlementUnHold']['msg']);
//           }
//
//         } else {
//           throw AppException(message: AppConstants.UNHOLD_ITEM_ERROR);
//         }
//       }
//       throw AppException(message: AppConstants.UNHOLD_ITEM_ERROR);
//     } on ApiException catch (e, stacktrace) {
//       Helper.captureException(e, stacktrace);
//       throw AppException(message: AppConstants.UNHOLD_ITEM_ERROR);
//     } on AppException catch (e) {
//       throw AppException(message: e.message);
//     } catch (e, stacktrace) {
//       Helper.captureException(e, stacktrace);
//       Helper.printLog("Error : ${e.toString()}");
//       throw AppException(message: AppConstants.UNHOLD_ITEM_ERROR);
//     }
//   }
}
