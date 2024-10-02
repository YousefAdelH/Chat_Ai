import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onTap,
    required this.enableicone,
    required this.text,
    required this.size,
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
    this.fontweight,
    required this.textColor,
  });

  final String text;
  final VoidCallback? onTap;
  final double size;
  final double width;
  final double height;
  final Color color;
  final double borderRadius;
  final FontWeight? fontweight;
  final Color textColor;
  final bool enableicone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: TextStyle(
                    color: textColor,
                    fontFamily: AppFontNames.ralway,
                    fontSize: size,
                    fontWeight: fontweight),
                child: Text(text),
              ),
              SizedBox(
                width: 12.w,
              ),
              if (enableicone)
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
