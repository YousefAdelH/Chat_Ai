import 'package:chat_gpt_task/Features/chat/controller/get_chat_controller.dart';
import 'package:chat_gpt_task/Features/chat/widget/history_chat.dart';
import 'package:chat_gpt_task/Features/chat/widget/message.dart';
import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:chat_gpt_task/core/utils/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatScreenGet extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  ChatScreenGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 45.h),
                  child: ListView.builder(
                    controller: controller.listScrollController,
                    itemCount: controller.chatList.length,
                    itemBuilder: (context, index) {
                      var chatItem = controller.chatList[index];
                      return ChatMessageWidget(
                        message: chatItem['msg'],
                        isSender: chatItem['chatIndex'] ==
                            1, // Assuming '1' is the sender's index
                        backgroundColor: chatItem['chatIndex'] == 0
                            ? AppColors.chat2
                            : AppColors.bottom,
                      );
                    },
                  ),
                );
              }),
            ),
            Obx(() {
              return controller.isTyping.value
                  ? const SpinKitThreeBounce(
                      color: Colors.white,
                      size: 18,
                    )
                  : const SizedBox();
            }),
            const SizedBox(height: 15),
            Material(
              color: Colors.grey[850],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: controller.focusNode,
                        style: const TextStyle(color: Colors.white),
                        controller: controller.textEditingController,
                        onSubmitted: (value) {
                          controller.sendMessageFCT();
                        },
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                controller.sendMessageFCT();
                              },
                              child: SvgPicture.asset(AssetPath.send),
                            ),
                          ),
                          hintText: "How can I help you?",
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // IconButton(
                    //   onPressed: controller.saveAndClearChat,
                    //   icon: const Icon(Icons.save, color: Colors.white),
                    //   tooltip: 'Save & Clear Chat',
                    // ),
                    // IconButton(
                    //   onPressed: () {
                    //     // Navigate to the history screen
                    //     Get.to(() => ChatHistoryScreen());
                    //   },
                    //   icon: const Icon(Icons.history, color: Colors.white),
                    //   tooltip: 'View History',
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
