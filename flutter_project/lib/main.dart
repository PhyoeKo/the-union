import 'package:MultiCal/app/data_sources/local/cache_manager.dart';
import 'package:MultiCal/main_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/features/demo_screens/change_theme/binding/change_theme_binding.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<CacheManager>(() async => CacheManager().init());

  ChangeThemeBindings().dependencies();


  runApp(
    const MyApp(),
  );
}
