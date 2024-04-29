import 'dart:convert';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aquaventure/buy_add_ons/models/buy_add_on_models.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/core/app_exceptions.dart';
import 'package:aquaventure/utils/helper.dart';

mixin CreateSessionData {
  Future<dynamic> createSessionData({Map? orderItems}) async {
    try {
      late String query;
      if (orderItems != null) {
      query = '''mutation MyMutation {
  createSessionData(sessionDataInput: $orderItems) {
    userHasAssociatedCC
    sessionData
    reference
    available
    countryCode
    errorMessage
    id
    merchantAccount
    plu
    recurringProcessingModel
    success
    shopperReference
    shopperInteraction
    returnUrl
    expiresAt
    amount {
      value
      currency
    }
  }
}''';
      } else {
        query = '''mutation MyMutation {
  createSessionData {
   amount {
      value
      currency
    }
    errorMessage
    expiresAt
    id
    merchantAccount
    recurringProcessingModel
    reference
    returnUrl
    sessionData
    shopperReference
    success
    userHasAssociatedCC
  }
}''';
      }
      Helper.printLog("Request : $query");
      final createSessionRequest = GraphQLRequest<String>(
        document: query,
      );
      final response =
          await Amplify.API.query(request: createSessionRequest).response;
      if (!response.hasErrors && response.data != null) {
        Helper.printLog("Response : ${response.data}");
        var jsonResponse = json.decode(response.data!);
        return jsonResponse;
      }
      Helper.printLog("Response : ${response.errors}");
      Helper.captureException(response.errors, "createSessionData");
      throw AppException(message: AppConstants.FAILED_CC_SESSION);
    } on SocketException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw Exception(AppConstants.NO_INTERNET_CONNECTION);
    } on ApiException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.FAILED_CC_SESSION);
    } catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw Exception(e.toString());
    }
  }
}
