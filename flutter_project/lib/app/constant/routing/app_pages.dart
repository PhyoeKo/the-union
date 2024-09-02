import 'package:MultiCal/app/constant/routing/app_route.dart';
import 'package:MultiCal/app/features/authentication/binding/auth_binding.dart';
import 'package:MultiCal/app/features/authentication/view/login_screen.dart';
import 'package:MultiCal/app/features/home_screen/binding/home_binding.dart';
import 'package:MultiCal/app/features/home_screen/screens/home_screen.dart';

import 'package:get/get.dart';

import '../../core/binding/initial_binding.dart';
import '../../features/demo_screens/change_language/binding/change_language_binding.dart';
import '../../features/demo_screens/change_language/screen/change_language_screen.dart';
import '../../features/demo_screens/change_theme/binding/change_theme_binding.dart';
import '../../features/demo_screens/change_theme/screen/change_theme_screen.dart';
import '../../features/demo_screens/select_language/binding/select_language_binding.dart';
import '../../features/demo_screens/select_language/screen/select_language_screen.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.loginScreen;

  static final routes = [
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      bindings: [
        AuthenticationBinding(),
      ],
    ),
    GetPage(
      name: Routes.changeLanguageScreen,
      page: () => ChangeLanguageScreen(),
      bindings: [
        ChangeLanguageBinding(),
      ],
    ),
    GetPage(
      name: Routes.changeTheme,
      page: () => ChangeThemeScreen(),
      bindings: [
        ChangeThemeBindings(),
      ],
    ),
    GetPage(
      name: Routes.selectLanguageScreen,
      page: () => SelectLanguageScreen(),
      bindings: [SelectLanguageBinding()],
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      bindings: [HomeBinding(), InitialBinding()],
    ),
  ];
}
