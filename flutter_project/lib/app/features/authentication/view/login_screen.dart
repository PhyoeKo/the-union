import 'package:MultiCal/app/core/base/base_view.dart';
import 'package:MultiCal/app/core/utils/app_utils.dart';
import 'package:MultiCal/app/features/authentication/controller/auth_controller.dart';
import 'package:MultiCal/app/widget/primary_button_widget.dart';
import 'package:MultiCal/app/widget/text_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../constant/resources/app_dimens.dart';
import '../../../constant/routing/app_pages.dart';
import '../../../constant/routing/app_route.dart';
import '../../../widget/default_app_bar_widget.dart';

class LoginScreen extends BaseView<AuthController> {
  LoginScreen({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppDimens.MARGIN_MEDIUM),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  const Icon(
                    Icons.flutter_dash, // Default Flutter icon
                    size: 100.0, // Size of the icon
                    color: Colors.blue, // Color of the icon
                  ),
                  const SizedBox(
                    height: AppDimens.MARGIN_CARD_MEDIUM_2,
                  ),
                  TextViewWidget(
                    "Welcome back you've \n been missed!".tr,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppDimens.MARGIN_CARD_MEDIUM_2,
                  ),
                  Form(
                    key: controller.staffFormKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.MARGIN_CARD_MEDIUM_2,
                        vertical: AppDimens.MARGIN_MEDIUM,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: AppDimens.MARGIN_MEDIUM_2,
                          ),
                          TextFormField(
                            controller: controller.codeController,
                            decoration: InputDecoration(labelText: 'Code'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your code';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: AppDimens.MARGIN_MEDIUM_2,
                          ),
                          TextFormField(
                            controller: controller.passwordController,
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: AppDimens.MARGIN_XLARGE,
                          ),
                          PrimaryButtonWidget(
                              onPress: () => controller.doLogin(),
                            // onPress: () => Get.offAllNamed(
                            //   Routes.homeScreen,
                            // ),
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppDimens.MARGIN_MEDIUM,
                              ),
                              child: TextViewWidget(
                                "Forgot Password",
                                onClick: () =>
                                    AppUtils.showToast("Forgot Password!"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
