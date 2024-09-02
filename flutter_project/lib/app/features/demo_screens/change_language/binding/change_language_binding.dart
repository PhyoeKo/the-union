
import 'package:get/get.dart';

import '../controller/change_language_controller.dart';

class ChangeLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeLanguageController());
  }
}
