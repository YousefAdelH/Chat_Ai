import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chat_gpt_task/Features/splash/view/description_pages.dart';
import 'package:chat_gpt_task/core/widget/custom_text.dart';
import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  static String id = 'SplashPage';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      animationDuration: const Duration(milliseconds: 2000),
      splashIconSize: 400,
      splash: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 8,
          ),
          SvgPicture.asset(AssetPath.logo),
          SizedBox(
            height: 30.h,
          ),
          CustomText(
            text: "ChatGPT",
            size: 40.sp,
            fontWeight: FontWeight.w800,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      nextScreen: WelcomeChat(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
