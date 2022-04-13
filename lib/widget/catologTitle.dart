import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogTitle extends StatelessWidget {
  final Widget _catalogTitle;
  final Widget _catalogButton;

  CatalogTitle(this._catalogTitle, this._catalogButton);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: <Widget>[_catalogTitle, Spacer(), _catalogButton],
        ),
        padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)));
  }
}
