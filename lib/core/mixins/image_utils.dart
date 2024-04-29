import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:aquaventure/constants/app_colors.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/core/app_exceptions.dart';
import 'package:aquaventure/constants/app_images.dart';
import 'package:aquaventure/core/custom_widgets/custom_loader.dart';
import 'package:aquaventure/core/custom_widgets/custom_solid_buttom.dart';
import 'package:aquaventure/models/PartyMembers.dart';
import 'package:aquaventure/models/Profiles.dart';
import 'package:aquaventure/sharedprefrence/sharedprefrences.dart';
import 'package:aquaventure/utils/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

mixin ImageUtils {
  String get profilePic => SharedprefUtils.getString(AppConstants.profilePic);

  showImageOptions(BuildContext context,
      {required Function(XFile) selectedImage, Function()? keyboard}) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          // height: 280,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Center(
                child: Text(
                  'Select a Profile Photo',
                  style:
                      TextStyle(color: AppColors.PRIMARY_COLOR, fontSize: 20),
                ),
              ),
              const Center(
                child: Text(
                  'Select the photo from these resources.',
                  style:
                      TextStyle(color: AppColors.TEXT_GREY_COLOR, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomSolidButton(
                  buttonColor: AppColors.PRIMARY_COLOR,
                  onTap: () async {
                    Navigator.pop(context);
                    XFile? pickedImage =
                        await pickImage(imageSource: ImageSource.camera);
                    if (pickedImage != null) {
                      selectedImage(pickedImage);
                    }
                    if (keyboard != null) {
                      keyboard();
                    }
                  },
                  child: const Text(
                    "CAMERA",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 17),
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomSolidButton(
                  buttonColor: AppColors.PRIMARY_COLOR,
                  onTap: () async {
                    Navigator.pop(context);
                    XFile? pickedImage =
                        await pickImage(imageSource: ImageSource.gallery);
                    if (pickedImage != null) {
                      selectedImage(pickedImage);
                    }
                    if (keyboard != null) {
                      keyboard();
                    }
                  },
                  child: const Text(
                    "PHOTO LIBRARY",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 17),
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomSolidButton(
                  child: const Text(
                    "CANCEL",
                    style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 17),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (keyboard != null) {
                      keyboard();
                    }
                  })
            ],
          ),
        );
      },
      elevation: 20,
    );
  }

  Future<XFile?> pickImage({required ImageSource imageSource}) async {
    XFile? pickedImage = await ImagePicker()
        .pickImage(source: imageSource, requestFullMetadata: false);
    return pickedImage;
  }

  Widget showPlaceholderImage() {
    return Lottie.asset(
      AppImages.APP_LOGO_JSON,
      width: 60,
      height: 60,
    );
    // return Lottie.asset(AppImages.TRIDENT_WITH_ADD_CIRCLE_ICON,
    //     width: 60, height: 60);
  }

  Future<String> uploadImage({required XFile pickedFile}) async {
    final key = const Uuid().v1();
    try {
      final result = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(
          pickedFile.openRead(),
          size: await pickedFile.length(),
        ),
        options: const StorageUploadFileOptions(
            accessLevel: StorageAccessLevel.protected),
        key: key,
      ).result;
      Helper.printLog(
          'Successfully uploaded image: ${result.uploadedItem.key}');
      return result.uploadedItem.key;
    } on StorageException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog('Error uploading image: $e');
      throw Exception(e.message);
    } catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog('Error uploading image: $e');
      throw Exception(AppConstants.FAILED_IMAGE_UPLOAD);
    }
  }

  Future<String> getDownloadUrl({
    required String key,
    required StorageAccessLevel accessLevel,
  }) async {
    try {
      final result = await Amplify.Storage.getUrl(
        key: key,
        options: StorageGetUrlOptions(
          accessLevel: accessLevel,
          pluginOptions: const S3GetUrlPluginOptions(
            expiresIn: Duration(minutes: 1),
          ),
        ),
      ).result;
      return result.url.toString();
    } on StorageException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      return '';
    } catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      return '';
    }
  }

  Future<Profiles?> updateProfileImage({required String profilePic}) async {
    try {
      String query = '''mutation MyMutation {
  updateProfiles(input: { guest: "${SharedprefUtils.getString(AppConstants.userId)}",
   profile_pic: "$profilePic"}) {
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
      throw AppException(message: AppConstants.IMAGE_UPLOAD_FAILED);
    } on ApiException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.IMAGE_UPLOAD_FAILED);
    } catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.IMAGE_UPLOAD_FAILED);
    }
  }

  Future<PartyMembers?> updatePartyMemberImage(
      {required String profilePic, required String partyMemberId}) async {
    try {
      String query = '''mutation MyMutation {
  updatePartyMembers(input: { id: "$partyMemberId",
   profile_pic: "$profilePic"}) {
     id
      name
      owner
      partyMembersVisitsVisit_id
      profile_pic
      cc_limit
  }
}''';
      final updateProfileRequest = GraphQLRequest<String>(document: query);
      final response =
          await Amplify.API.query(request: updateProfileRequest).response;
      if (!response.hasErrors && response.data != null) {
        var jsonResponse = json.decode(response.data!);
        PartyMembers? profiles =
            PartyMembers.fromJson(jsonResponse['updatePartyMembers']);
        return profiles;
      }
      throw AppException(message: AppConstants.IMAGE_UPLOAD_FAILED);
    } on ApiException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.IMAGE_UPLOAD_FAILED);
    } catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      throw AppException(message: AppConstants.IMAGE_UPLOAD_FAILED);
    }
  }
}
