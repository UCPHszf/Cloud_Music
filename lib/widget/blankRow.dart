import 'package:Cloud_Music/resource/config/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlankRow extends StatelessWidget {
  final double height;

  BlankRow(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: ScreenUtil().setHeight(height));
  }
}

class BlankRowFilled extends StatelessWidget {
  final double height;

  BlankRowFilled(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(height),
      child: DecoratedBox(
        decoration: BoxDecoration(color: ColorConfig.filled_blank_row_bg),
      ),
    );
  }
}
