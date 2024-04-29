import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/core/app_exceptions.dart';
import 'package:aquaventure/models/Profiles.dart';
import 'package:aquaventure/sharedprefrence/sharedprefrences.dart';
import 'package:aquaventure/utils/helper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:launchdarkly_flutter_client_sdk/launchdarkly_flutter_client_sdk.dart';

mixin UserProfileMixin {
  Future<Profiles?> getUserProfile(String userId) async {
    try {
      String query = '''query MyQuery {
  getProfiles(guest: "$userId") {
    user_name
    gender
    given_name
    country
    createdAt
    dob
    email
    family_name
    guest
    profile_pic
    updatedAt
    phone_number
  }
}
''';
      final userProfileRequest = GraphQLRequest<String>(document: query);
      final response =
          await Amplify.API.query(request: userProfileRequest).response;
      if (!response.hasErrors && response.data != null) {
        var jsonResponse = json.decode(response.data!);
        if (jsonResponse['getProfiles'] != null) {
          Profiles? profiles = Profiles.fromJson(jsonResponse['getProfiles']);
          return profiles;
        } else {
          /// It means complete registration is pending
          return null;
        }
      }
      throw AppException(message: AppConstants.USER_DETAILS_FAILED);
    } on ApiException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.USER_DETAILS_FAILED);
    } on AppException catch (e) {
      throw AppException(message: e.message);
    } catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.USER_DETAILS_FAILED);
    }
  }

  Future<Profiles?> updateUserProfile({required Profiles profiles}) async {
    try {
      String query = '''mutation MyMutation {
  updateProfiles(input: {
  country: "${profiles.country}",
   dob: "${profiles.dob}", family_name: "${profiles.family_name}", gender: ${profiles.gender.name}, given_name: "${profiles.given_name}", guest: "${profiles.guest}", profile_pic: "${profiles.profile_pic}", user_name: ""}) {
    email
    given_name
    family_name
    country
    dob
    profile_pic
    user_name
    gender
  }
}''';
      final updateProfileRequest = GraphQLRequest<String>(document: query);
      final response =
          await Amplify.API.query(request: updateProfileRequest).response;
      if (!response.hasErrors && response.data != null) {
        var jsonResponse = json.decode(response.data!);
        Profiles? profiles = Profiles.fromJson(jsonResponse['updateProfiles']);
        return profiles;
      }
      throw AppException(message: AppConstants.USER_DETAILS_FAILED);
    } on ApiException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.USER_DETAILS_FAILED);
    } catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.USER_DETAILS_FAILED);
    }
  }

  void saveUserDetails(
      {String? userId,
      String? name,
      String? emailId,
      String? imageUrl,
      bool rememberMe = false,
      Profiles? profile})  {
    SharedprefUtils.setBool(AppConstants.loggedIn, true);
    if (userId != null) {
      SharedprefUtils.setString(AppConstants.userId, userId);
    }

    if (name != null) {
      SharedprefUtils.setString(AppConstants.name, name);
    }
    if (emailId != null) {
      SharedprefUtils.setString(AppConstants.emailId, emailId);
    }
    if (imageUrl != null) {
      SharedprefUtils.setString(AppConstants.profilePic, imageUrl);
    }
    SharedprefUtils.setBool(AppConstants.rememberMe, rememberMe);
    if (profile != null) {
      SharedprefUtils.setString(
          AppConstants.name, "${profile.given_name} ${profile.family_name}");
      SharedprefUtils.setString(
          AppConstants.profileKey, "${profile.profile_pic}");
    }
  }

  // Future<void> fetchGroupName() async {
  //   try {
  //     final session =
  //         await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;
  //     final idToken = session.userPoolTokensResult.value.idToken;
  //     final userGroups = idToken.groups;
  //     Helper.printLog("GROUPS : $userGroups");
  //     if(userGroups.isNotEmpty) {
  //       SharedprefUtils.setString(AppConstants.groupName, userGroups.first.toString());
  //     } else {
  //       SharedprefUtils.setString(AppConstants.groupName, "user");
  //     }
  //   } on AmplifyException catch (e, stackTrace) {
  //     Helper.captureException(e, stackTrace);
  //     Helper.printLog("Error : ${e.toString()}");
  //   }
  // }

  void saveCompleteProfileStatus({required bool status}) {
    SharedprefUtils.setBool(AppConstants.completedProfile, status);
  }
}
