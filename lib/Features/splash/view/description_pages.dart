import 'package:chat_gpt_task/Features/home/new_chat.dart';
import 'package:chat_gpt_task/Features/splash/widgets/custom_button.dart';
import 'package:chat_gpt_task/Features/splash/widgets/description_widget.dart';
import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeChat extends StatefulWidget {
  const WelcomeChat({Key? key}) : super(key: key);

  static String id = 'DescriptionPages';

  @override
  State<WelcomeChat> createState() => _WelcomeChatState();
}

class _WelcomeChatState extends State<WelcomeChat> {
  final controller = PageController();

  String namebottom = "Next";
  int currentPage = 0; // Track the current page index

  @override
  void initState() {
    super.initState();
    // Set up a listener for the page controller
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.toInt() ?? 0; // Update current page
        namebottom =
            currentPage == 2 ? "Let’s Chat" : "Next"; // Update button text
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        controller: controller,
        children: [
          DescriptionWidget(
            onTap: () {
              nextPage();
            },
            screenName: 'Examples',
            title1: "“Explain quantum computing in simple terms”",
            title2: "“Got any creative ideas for a 10 year old’s birthday?”",
            title3: "“How do I make an HTTP request in Javascript?”",
            screenImage: AssetPath.sun,
          ),
          DescriptionWidget(
            onTap: () {
              nextPage();
            },
            screenName: 'Capabilities',
            title1: "Remembers what user said earlier in the conversation",
            title2: "Allows user to provide follow-up corrections",
            title3: "Trained to decline inappropriate requests",
            screenImage: AssetPath.capabilities,
          ),
          DescriptionWidget(
            onTap: () {
              Get.offAll(
                () => const homeView(),
                transition: Transition.noTransition, // No transition with GetX
              );
            },
            screenName: 'Limitations',
            title1: "May occasionally generate incorrect information",
            title2:
                "May occasionally produce harmful instructions or biased content",
            title3: "Limited knowledge of world and events after 2021",
            screenImage: AssetPath.limitations,
          ),
        ],
      ),
      Positioned(
        bottom: 40,
        left: 0,
        right: 0,
        child: Column(
          children: [
            Container(
              alignment: const Alignment(0, .93),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.bottom,
                  expansionFactor: 1.5,
                  spacing: 12,
                  dotHeight: 2,
                  dotWidth: 20,
                  dotColor: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              onTap: () {
                nextPage();
              },
              borderRadius: 8,
              text: namebottom,
              fontweight: FontWeight.w700,
              size: 18.sp,
              width: 335.w,
              height: 43.h,
              color: AppColors.bottom,
              textColor: Colors.white,
              enableicone: currentPage == 2,
            ),
          ],
        ),
      ),
    ]);
  }

  nextPage() {
    int nextPageIndex = controller.page!.toInt() + 1;
    if (nextPageIndex == 3) {
      // If the next page is the 3rd page, navigate to ChatView
      Get.offAll(
        () => const homeView(),
        transition: Transition.noTransition, // No transition with GetX
      );
    } else if (nextPageIndex == 2) {
      namebottom = "Let’s Chat";
      controller.animateToPage(controller.page!.toInt() + 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    } else {
      controller.animateToPage(controller.page!.toInt() + 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }
}
