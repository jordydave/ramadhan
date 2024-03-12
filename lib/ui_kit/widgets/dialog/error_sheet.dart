import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadhan_app/ui_kit/color/colors.dart';
import 'package:ramadhan_app/ui_kit/font_style/font_styles.dart';
import 'package:ramadhan_app/ui_kit/widgets/button/general_button.dart';
import 'package:ramadhan_app/ui_kit/widgets/shared/sheet_blur.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ErrorSheet extends StatelessWidget {
  final String title;
  final String? content;
  final String? textButton;
  final VoidCallback? onTap;
  const ErrorSheet({
    super.key,
    this.title = "Mohon Maaf...",
    this.content,
    this.onTap,
    this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return SheetBlur(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 13.sp),
                width: 26.sp,
                height: 10.sp,
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 2.5.h),
            Center(
              child: Text(
                title,
                style: AppStyles.primaryText.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 1.0.h),
            Center(
              child: Text(
                content ?? "Oops, ada sesuatu yang salah",
                textAlign: TextAlign.center,
                style: AppStyles.secondaryText.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 3.5.h),
            GeneralButton.secondary(
              width: context.width,
              title: textButton ?? "OK",
              height: 5.5.h,
              onPressed: () {
                Get.back(result: true);
              },
            ),
            SizedBox(height: 2.0.h),
          ],
        ),
      ),
    );
  }
}
