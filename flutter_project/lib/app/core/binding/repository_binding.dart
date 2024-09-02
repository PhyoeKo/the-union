import 'package:get/get.dart';

import '../../data_sources/network/auth/auth_repository.dart';
import '../../data_sources/network/auth/auth_repository_impl.dart';

class RepositoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      tag: (AuthRepository).toString(),
      fenix: true,
    );
  }
}
