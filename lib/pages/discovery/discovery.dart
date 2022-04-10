import 'package:Cloud_Music/pages/discovery/widget/carousel.dart';
import 'package:Cloud_Music/pages/discovery/widget/catalog.dart';
import 'package:Cloud_Music/utils/wrapUtil.dart';
import 'package:Cloud_Music/widget/blankRow.dart';
import 'package:flutter/material.dart';
import 'package:Cloud_Music/resource/data/musicIcon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Cloud_Music_Icon.unorderedlist), onPressed: () {}),
        title: Text('周杰伦'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Cloud_Music_Icon.mic))
        ],
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          Carousel(),
          WrapUtil.wrapInSilver(BlankRow(5)),
          PageDiscoveryCatalog(),
          WrapUtil.wrapInSilver(BlankRow(20)),
          Row(children: <Widget>[],)
        ],
      ),
    );
  }
}
