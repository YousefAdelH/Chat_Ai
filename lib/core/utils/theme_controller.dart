import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ThemeController extends GetxController {
  // Observable theme mode, default is ThemeMode.dark
  var isDarkMode = true.obs;

  // Toggle between dark and light mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}
