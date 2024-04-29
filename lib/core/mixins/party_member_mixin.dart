

import 'dart:convert';
import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/core/app_exceptions.dart';
import 'package:aquaventure/models/PartyMembers.dart';
import 'package:aquaventure/sharedprefrence/sharedprefrences.dart';
import 'package:aquaventure/utils/helper.dart';

mixin PartyMemberMixin{
  Future<dynamic> getPartyMembers() async {
    try {
      String graphQLDocument = '''query MyQuery {
      findMyFriends {
    data {
      id
      location
      name
      status
      coordinates {
        latitude
        longitude
      }
    }
    message
    status
  }
  partyMembersByOwner(owner: "${SharedprefUtils.getString(AppConstants.userId)}") {
    nextToken
    items {
      id
      name
      owner
      partyMembersVisitsVisit_id
      profile_pic
      cc_limit
    }
  }
}''';


      final partyMembersRequest = GraphQLRequest<String>(
        document: graphQLDocument,
      );

      final queryResponse = Amplify.API.query(request: partyMembersRequest);
      final response = await queryResponse.response;
      if (!response.hasErrors && response.data != null) {
        final jsonResponse = json.decode(response.data!);
        return jsonResponse;
      }

      return null;
    } on SocketException catch (e, stackTrace) {
      Helper.captureException(e, stackTrace);
      throw Exception(AppConstants.NO_INTERNET_CONNECTION);
    } on ApiException catch (e, stackTrace) {
      Helper.captureException(e, stackTrace);
      throw AppException(message: "Failed to get group details" );
    } catch (e, stackTrace) {
      Helper.printLog(e.toString());
      Helper.captureException(e, stackTrace);
      return null;
    }
  }
}