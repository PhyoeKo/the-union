
import 'package:MultiCal/app/core/binding/repository_binding.dart';
import 'package:MultiCal/app/core/binding/view_controller_binding.dart';
import 'package:get/get.dart';

import 'cached_manager_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    CachedManagerBinding().dependencies();
    RepositoryBinding().dependencies();
    ViewControllerBinding().dependencies();
  }
}
