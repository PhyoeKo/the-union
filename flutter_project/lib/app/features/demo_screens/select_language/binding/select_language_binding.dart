import 'package:get/get.dart';

import '../controller/select_language_controller.dart';

class SelectLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectLanguageController());
  }
}
