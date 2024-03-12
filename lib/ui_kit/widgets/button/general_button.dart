import 'package:flutter/material.dart';
import 'package:ramadhan_app/ui_kit/color/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GeneralButton extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final String title;
  final VoidCallback onPressed;
  final double? height;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final double? width;
  final bool enabled;
  final double elevation;
  final double fontSize;
  final Color color;
  final Color borderColor;
  final Color textColor;

  const GeneralButton({
    super.key,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    required this.title,
    required this.onPressed,
    required this.color,
    required this.borderColor,
    required this.textColor,
    this.width,
    this.enabled = true,
    this.paddingVertical,
    this.paddingHorizontal,
    this.elevation = 0,
    this.fontSize = 16,
    this.height,
  });

  factory GeneralButton.primary({
    required String title,
    required VoidCallback onPressed,
    double fontSize = 16,
    double? paddingVertical,
    double? paddingHorizontal,
    double? height,
    double? width,
    bool enabled = true,
  }) {
    return GeneralButton(
      title: title,
      onPressed: onPressed,
      color: AppColors.primary,
      borderColor: AppColors.primary,
      textColor: Colors.white,
      paddingHorizontal: paddingHorizontal,
      paddingVertical: paddingVertical,
      fontSize: fontSize,
      height: height,
      width: width,
      enabled: enabled,
    );
  }

  factory GeneralButton.secondary({
    required String title,
    required VoidCallback onPressed,
    double? paddingVertical,
    double? paddingHorizontal,
    double? height,
    double? width,
  }) {
    return GeneralButton(
      title: title,
      onPressed: onPressed,
      color: Colors.white,
      borderColor: AppColors.primary,
      textColor: AppColors.primary,
      paddingHorizontal: paddingHorizontal,
      paddingVertical: paddingVertical,
      height: height,
      width: width,
    );
  }

  factory GeneralButton.text({
    required String title,
    required VoidCallback onPressed,
    double fontSize = 16,
    double? paddingVertical,
    double? paddingHorizontal,
    double? height,
    double? width,
  }) {
    return GeneralButton(
      title: title,
      onPressed: onPressed,
      color: Colors.transparent,
      borderColor: Colors.transparent,
      textColor: AppColors.primary,
      paddingHorizontal: paddingHorizontal,
      paddingVertical: paddingVertical,
      fontSize: fontSize,
      height: height,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 5.5.h,
      width: width,
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        disabledColor: AppColors.grey,
        minWidth: 0,
        elevation: (this).elevation,
        color: color,
        highlightElevation: 0,
        focusElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: enabled
              ? BorderSide(
                  color: borderColor,
                  width: 1.0,
                )
              : const BorderSide(
                  color: AppColors.grey,
                  width: 1.0,
                ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal != null ? paddingHorizontal! : 2.w,
          vertical: paddingVertical != null ? paddingVertical! : 1.h,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize.sp,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
