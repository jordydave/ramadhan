import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SheetBlur extends StatelessWidget {
  final Widget child;
  const SheetBlur({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.transparent,
            height: 3.h,
          ),
          SizedBox(height: 1.h),
          (this).child,
        ],
      ),
    );
  }
}
