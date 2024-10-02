import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:chat_gpt_task/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatMessageWidget extends StatelessWidget {
  final String message;
  final bool isSender; // True if the message is sent by the user
  final Color backgroundColor;

  const ChatMessageWidget({
    Key? key,
    required this.message,
    required this.isSender,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          Align(
            alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.75,
              ),
              // width: MediaQuery.sizeOf(context).width * 0.75,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isSender ? AppColors.bottom : AppColors.chat2,
                borderRadius: isSender
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          if (!isSender)
            Row(
              children: [
                SvgPicture.asset(
                  AssetPath.like,
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  height: 20,
                ),
                SizedBox(
                  width: 16.w,
                ),
                SvgPicture.asset(
                  AssetPath.dislike,
                  color: Theme.of(context).textTheme.bodyText2?.color,
                  height: 20,
                ),
                SizedBox(
                  width: 40.w,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetPath.copy,
                        color: Theme.of(context).textTheme.bodyText2?.color,
                        height: 16,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      CustomText(
                        text: 'copy',
                      )
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
