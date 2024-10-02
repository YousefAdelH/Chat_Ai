import 'package:chat_gpt_task/core/widget/custom_text.dart';
import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class DescriptionWidget extends StatelessWidget {
  DescriptionWidget(
      {super.key,
      required this.screenName,
      this.skipText,
      required this.screenImage,
      required this.onTap,
      required this.title1,
      required this.title2,
      required this.title3});
  String screenName;
  String? skipText;
  String title2;
  String title1;
  String title3;
  String screenImage;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: AppColors.primary,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 38.h),
          child: Column(
            children: [
              SvgPicture.asset(
                AssetPath.logo,
                width: 24.w,
                height: 24.h,
              ),
              CustomText(
                text: "Welcome to \n ChatGPT ",
                size: 32.sp,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              CustomText(
                text: "Ask anything, get yout answer",
                size: 16.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60.h,
              ),
              SizedBox(
                height: 20.h,
                width: 20.w,
                child: SvgPicture.asset(
                  screenImage,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomText(
                text: screenName,
                size: 20.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                width: 335.w,
                height: 62.h,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
                decoration: BoxDecoration(
                  color: AppColors.smallContainer,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: CustomText(
                  text: title1,
                  size: 15.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: 335.w,
                height: 62.h,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
                decoration: BoxDecoration(
                  color: AppColors.smallContainer,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: CustomText(
                  text: title2,
                  size: 15.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: 335.w,
                height: 62.h,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
                decoration: BoxDecoration(
                  color: AppColors.smallContainer,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: CustomText(
                  text: title3,
                  size: 15.sp,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
