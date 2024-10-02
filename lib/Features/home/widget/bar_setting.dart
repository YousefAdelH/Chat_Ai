import 'package:chat_gpt_task/core/widget/custom_text.dart';
import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BarSetting extends StatelessWidget {
  final String name;
  final String image;
  final bool enableicone;
  final Color? colorname;
  final void Function() ontap;
  const BarSetting({
    Key? key,
    required this.name,
    required this.image,
    required this.enableicone,
    this.colorname,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 52.h,
        width: 335.w,
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              color: Theme.of(context).textTheme.bodyText2?.color,
            ),
            SizedBox(
              width: 16.w,
            ),
            CustomText(
              text: name,
              size: 16.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
            if (enableicone)
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(AssetPath.newv),
                ],
              )),
          ],
        ),
      ),
    );
  }
}
