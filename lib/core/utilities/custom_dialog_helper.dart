import 'package:flutter/material.dart';

import '/core/constants/num_constants.dart';
import '/core/enums/dialog_helper_enum.dart';
import '/core/themes/app_colors.dart';

class DialogHelper {
  static void showOopsDialog({
    required BuildContext context,
    required DialogHelperEnum dialogHelperEnum,
    required String buttonText,
    required VoidCallback onButtonTap,
    VoidCallback? onBottomButtonTap,
    String? bottomButtonText,
    String? description,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: dialogHelperEnum.title,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: AppColors.whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(dialogHelperEnum.image),
                  const SizedBox(height: NumConstants.value20),
                  Center(
                    child: Text(
                      dialogHelperEnum.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: NumConstants.value16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.color55515C,
                      ),
                    ),
                  ),
                  if ((description?.isNotEmpty ?? false) ||
                      dialogHelperEnum.subtitle.isNotEmpty)
                    const SizedBox(height: NumConstants.value18),
                  if ((description?.isNotEmpty ?? false) ||
                      dialogHelperEnum.subtitle.isNotEmpty)
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: NumConstants.value170,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: NumConstants.value16,
                          ),
                          child: Text(
                            description ?? dialogHelperEnum.subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: NumConstants.value16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.color55515C,
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: NumConstants.value18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onButtonTap();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.color2C2F42,
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: Text(
                        dialogHelperEnum.buttonText.toUpperCase(),
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: NumConstants.value14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: NumConstants.value18),
                  if (bottomButtonText?.isNotEmpty ?? false)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextButton(
                        onPressed: () {
                          if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          }
                          onBottomButtonTap!();
                        },
                        child: Text(
                          bottomButtonText ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.colorDA251D,
                            fontSize: NumConstants.value15,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
