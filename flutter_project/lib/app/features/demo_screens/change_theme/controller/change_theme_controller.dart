import 'package:MultiCal/app/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeThemeController extends BaseController{

  RxBool isLightTheme= false.obs;


  void setDarkMode(){
    isLightTheme(true);

    Get.changeThemeMode(
      ThemeMode.dark ,
    );
  }

  void setLightMode(){
    isLightTheme(false);

    Get.changeThemeMode(
      ThemeMode.light ,
    );
  }

}