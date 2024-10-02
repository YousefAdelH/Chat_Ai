import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxBool isTyping = false.obs;
  RxList<Map<String, dynamic>> chatList = <Map<String, dynamic>>[].obs;
  RxList<List<Map<String, dynamic>>> chatHistory =
      <List<Map<String, dynamic>>>[].obs;

  // Text and scroll controllers
  TextEditingController textEditingController = TextEditingController();
  ScrollController listScrollController = ScrollController();
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    // Example chat for testing
    chatList.value = [];
  }

  @override
  void onClose() {
    textEditingController.dispose();
    listScrollController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  // Send a message function
  void sendMessageFCT() {
    if (isTyping.value || textEditingController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "You can't send multiple or empty messages",
        backgroundColor: AppColors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isTyping.value = true;
    String msg = textEditingController.text;
    chatList.add({'msg': msg, 'chatIndex': 1});
    textEditingController.clear();
    focusNode.unfocus();

    Future.delayed(const Duration(seconds: 2), () {
      chatList.add({
        'msg':
            'ChatGPT is a language model based on the GPT (Generative Pretrained Transformer) architecture developed by OpenAI. It uses deep learning, specifically the transformer neural network architecture, to generate human-like text based on the input it receives. Here’s an overview of how it works:',
        'chatIndex': 0
      });
      isTyping.value = false;
      scrollListToEND();
    });
  }

  // Scroll to end function
  void scrollListToEND() {
    listScrollController.animateTo(
      listScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }

  void clearhistory() {
    chatHistory.clear();
    update();
  }

  // Clear the chat
  void clearChat() {
    chatList.clear();
    update();
  }

  // Save chat to history and then clear it
  void saveAndClearChat() {
    if (chatList.isNotEmpty) {
      chatHistory.add(List.from(chatList)); // Save current chat to history
      clearChat(); // Clear the current chat
      Get.snackbar(
        "Success",
        "Chat saved to history and cleared.",
        backgroundColor: AppColors.bottom,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {}
  }

  // View chat history
  List<List<Map<String, dynamic>>> getChatHistory() {
    return chatHistory;
  }
}
