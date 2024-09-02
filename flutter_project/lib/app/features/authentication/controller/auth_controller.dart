import 'dart:convert';

import 'package:MultiCal/app/core/base/base_controller.dart';
import 'package:MultiCal/app/data_models/request_object/login_request_ob.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../constant/routing/app_route.dart';
import '../../../core/utils/app_utils.dart';
import '../../../data_models/base_response/base_api_response.dart';
import '../../../data_models/exception/base_exception.dart';
import '../../../data_models/responses/login_response.dart';
import '../../../data_sources/local/cache_manager.dart';
import '../../../data_sources/network/auth/auth_repository.dart';

class AuthController extends BaseController {
  final staffFormKey = GlobalKey<FormState>();

  final codeController = TextEditingController();
  final passwordController = TextEditingController();

  RxString? errorMsg = "".obs;

  final AuthRepository _repository = Get.find(tag: (AuthRepository).toString());

  doLogin() {
    if (staffFormKey.currentState!.validate()) {
      return;
    }
    errorMsg?.value = "";

    var requestOb = LoginRequest(
      code: codeController.text.trim(),
      password: passwordController.text,
    );
    final repoService = _repository.doLogin(requestOb);
    AppUtils.showLoaderDialog();
    callAPIService(
      repoService,
      onSuccess: (response) {
        if (response != null) {
          BaseApiResponse<LoginResponse> _loginData =
              response as BaseApiResponse<LoginResponse>;
          LoginResponse _loginResponse = _loginData.objectResult;

          if (_loginData.objectResult != null) {
            setData(
                CacheManagerKey.loginResponseData, jsonEncode(_loginResponse));
            Get.back();
            Get.offAllNamed(
              Routes.homeScreen,
            );
          }
        } else {
          AppUtils.showToast("Something went wrong!");
        }
      },
      onError: (BaseException exception) {
        Get.back();
        errorMsg?.value = exception.message;
        AppUtils.showToast(exception.message);
      },
    );
  }
}
