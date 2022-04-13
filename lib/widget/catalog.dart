import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:Cloud_Music/widget/catologTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Catalog extends StatelessWidget {
  final CatalogTitle catalogTitle;
  final Widget catalogContent;

  Catalog(this.catalogTitle, this.catalogContent);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: DimensionConfig.catalogHorizonPadding,
          vertical: DimensionConfig.catalogVerticalPadding),
      child: Column(
        children: <Widget>[catalogTitle, catalogContent],
      ),
    );
  }
}
