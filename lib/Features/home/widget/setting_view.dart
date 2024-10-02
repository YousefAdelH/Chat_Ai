import 'package:chat_gpt_task/Features/chat/controller/get_chat_controller.dart';
import 'package:chat_gpt_task/Features/chat/widget/history_chat.dart';
import 'package:chat_gpt_task/Features/home/widget/bar_setting.dart';
import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:chat_gpt_task/core/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SettingView extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());
  final ThemeController themeController = Get.find();
  SettingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 250.h, child: ChatHistoryScreen()),
          SizedBox(
            height: 500.h,
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  height: 1.h,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 8.h,
                ),
                BarSetting(
                  name: "Clear conversations",
                  image: AssetPath.bin,
                  enableicone: false,
                  ontap: () {
                    controller.clearhistory();
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                BarSetting(
                  ontap: () {},
                  image: AssetPath.person,
                  enableicone: true,
                  name: "Upgrade to Plus",
                ),
                SizedBox(
                  height: 8.h,
                ),
                Obx(
                  () => BarSetting(
                    name: themeController.isDarkMode.value
                        ? "Light Mode"
                        : "Dark Mode",
                    image: themeController.isDarkMode.value
                        ? AssetPath.sun
                        : AssetPath.moon,
                    enableicone: false,
                    ontap: () {
                      themeController
                          .toggleTheme(); // Toggle theme when pressed
                    },
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                BarSetting(
                  ontap: () {},
                  image: AssetPath.update,
                  enableicone: false,
                  name: "Updates & FAQ",
                ),
                SizedBox(
                  height: 8.h,
                ),
                BarSetting(
                  ontap: () {},
                  image: AssetPath.logout,
                  enableicone: false,
                  name: "Logout",
                  colorname: AppColors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
