import 'package:get/get.dart';

import '../../features/home_screen/binding/home_binding.dart';

class ViewControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeBinding>(
      () => HomeBinding(),
    );
  }
}
