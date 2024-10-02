import 'package:chat_gpt_task/Features/chat/controller/get_chat_controller.dart';
import 'package:chat_gpt_task/Features/chat/widget/card_message_history.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:chat_gpt_task/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatHistoryScreen extends StatelessWidget {
  final ChatController controller = Get.find<ChatController>();

  ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.chatHistory.isEmpty
            ? const Center(
                child: CustomText(text: 'No chat history available.'))
            : ListView.builder(
                itemCount: controller.chatHistory.length,
                itemBuilder: (context, index) {
                  final chat = controller.chatHistory[index];
                  return CardMessage(
                    message: chat[index]['msg'],
                    ontap: () {},
                  );
                },
              );
      }),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
