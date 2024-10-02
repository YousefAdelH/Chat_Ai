import 'package:chat_gpt_task/Features/splash/view/splash_page.dart';
import 'package:chat_gpt_task/core/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(() {
          return GetMaterialApp(
            themeMode: themeController.isDarkMode.value
                ? ThemeMode.dark
                : ThemeMode.light, // Switch between dark and light themes
            theme: ThemeData.light(), // Light theme
            darkTheme: ThemeData.dark(), // Dark theme
            home: const SplashPage(),
            debugShowCheckedModeBanner: false,
          );
        });
      },
    );
  }
}
