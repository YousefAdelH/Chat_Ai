import 'package:chat_gpt_task/Features/chat/chat_view.dart';
import 'package:chat_gpt_task/Features/home/widget/bar_setting.dart';
import 'package:chat_gpt_task/Features/home/widget/setting_view.dart';
import 'package:chat_gpt_task/core/widget/custom_text.dart';
import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class homeView extends StatelessWidget {
  const homeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 20.h,
                width: 20.w,
                child: SvgPicture.asset(
                  AssetPath.message,
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  height: 15.h,
                  width: 15.w,
                )),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(ChatView()),
            child: SizedBox(
              height: 20.h,
              width: 20.w,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
          )
        ],
        title: CustomText(
          text: "New Chat",
          size: 16.sp,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              color: Theme.of(context).textTheme.bodyText2?.color,
              height: 1.0,
            ),
          ),
        ),
      ),
      body: SettingView(),
    );
  }
}
