import 'package:chat_gpt_task/Features/chat/controller/get_chat_controller.dart';
import 'package:chat_gpt_task/Features/chat/widget/chat_message.dart';
import 'package:chat_gpt_task/core/utils/theme_controller.dart';
import 'package:chat_gpt_task/core/widget/custom_text.dart';
import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);
  final ChatController controller = Get.put(ChatController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeController.isDarkMode.value
            ? AppColors.primary
            : AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(AssetPath.logo)),
            )
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: "back",
                size: 16.sp,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.5),
            child: Container(
              color: Theme.of(context).textTheme.bodyText2?.color,
              height: 0.5,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              controller.saveAndClearChat();

              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Theme.of(context).textTheme.bodyText2?.color,
            ), // C,
          ),
        ),
        body: ChatScreenGet()
        //  ChatScreen()
        );
  }
}
