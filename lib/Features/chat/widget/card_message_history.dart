import 'package:chat_gpt_task/core/utils/assets_paths.dart';
import 'package:chat_gpt_task/core/utils/styles.dart';
import 'package:chat_gpt_task/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardMessage extends StatelessWidget {
  CardMessage({Key? key, required this.message, required this.ontap})
      : super(key: key);
  final String message;

  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AssetPath.message,
                      color: Theme.of(context).textTheme.bodyText2?.color,
                      height: 20.h,
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: CustomText(
                        text: message,
                        size: 16.sp,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // ignore: prefer_const_constructors
                        OptionsB(),

                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Theme.of(context).textTheme.bodyText2?.color,
                          size: 15,
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              color: Theme.of(context).textTheme.bodyText2?.color,
              height: 0.5.h,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}

class OptionsB extends StatelessWidget {
  const OptionsB({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) async {
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;

        await showMenu(
          context: context,
          color: AppColors.primary,
          position: RelativeRect.fromRect(
            details.globalPosition & const Size(40, 40),
            Offset.zero & overlay.size,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          items: [
            PopupMenuItem(
              padding: EdgeInsets.zero,
              height: 24.h,
              child: InkWell(
                onTap: () {
                  // Handle edit action
                },
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    SvgPicture.asset(
                      AssetPath.pin,
                      width: 16,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: "Edit",
                      height: 1,
                      size: 12.sp,
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              padding: EdgeInsets.zero,
              height: 24.h,
              child: InkWell(
                onTap: () {
                  // Handle delete action
                },
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    SvgPicture.asset(
                      AssetPath.binred,
                      width: 16,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "Delete ",
                      style: TextStyle(
                          fontSize: 12.sp, height: 1, color: AppColors.red),
                    )
                  ],
                ),
              ),
            ),
          ],
          elevation: 8.0,
        );
      },
      child: Icon(
        Icons.more_vert,
        color: Theme.of(context).textTheme.bodyText2?.color,
        size: 15,
      ),
    );
  }
}
