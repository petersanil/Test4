import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aquaventure/authentication/login/login_screen.dart';
import 'package:aquaventure/constants/app_colors.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/core/custom_widgets/custom_solid_buttom.dart';
import 'package:aquaventure/core/custom_widgets/custom_text_form_field.dart';
import 'package:aquaventure/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteUserDialog extends StatelessWidget {
  final Function() onDelete;

  const DeleteUserDialog({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      onTap: () {
        showConfirmationDialog(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Delete Account',
            style: TextStyle(fontSize: 18, color: AppColors.TEXT_GREY_COLOR),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.FORWARD_ICON_COLOR,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  showConfirmationDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (_) => Align(
        alignment: Alignment.center,
        child: Container(
          height: 320,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'You are about to delete \n your account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.PRIMARY_COLOR,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.2,
                          fontFamily: AppConstants.AVERTAPE_FONT),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      'This action is not reversible. Once your account has been deleted you will no longer be able to access it.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.TEXT_GREY_COLOR,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.2,
                          fontFamily: AppConstants.AVERTAPE_FONT),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomSolidButton(
                            child: const Text(
                              "CANCEL",
                              style: TextStyle(
                                  color: AppColors.PRIMARY_COLOR,
                                  // letterSpacing: 1.5,
                                  fontSize: 15),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: CustomSolidButton(
                            buttonColor: AppColors.PRIMARY_COLOR,
                            child: const Text(
                              AppConstants.CONFIRM,
                              style: TextStyle(
                                    color: Colors.white,
                                  // letterSpacing: 1.5,
                                  fontSize: 15),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              onDelete();
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
