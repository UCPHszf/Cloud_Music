import 'package:Cloud_Music/pages/discovery/widget/carousel.dart';
import 'package:Cloud_Music/pages/discovery/widget/recommendCatalog.dart';
import 'package:Cloud_Music/pages/discovery/widget/recommendMusicList.dart';
import 'package:Cloud_Music/resource/data/text.dart';
import 'package:Cloud_Music/widget/catologTitle.dart';
import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:Cloud_Music/utils/wrapUtil.dart';
import 'package:Cloud_Music/widget/blankRow.dart';
import 'package:Cloud_Music/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Cloud_Music/resource/data/musicIcon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('周杰伦'), centerTitle: true, actions: [
        IconButton(onPressed: () {}, icon: Icon(NetEaseMusicIcon.mic))
      ]),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          Carousel(),
          WrapUtil().wrapInSilver(BlankRow(5)),
          RecommendCatalog(),
          WrapUtil().wrapInSilver(BlankRowFilled(0.5)),
          RecommendMusicList()
        ],
      ),
      drawer: NEMusicDrawer(),
    );
  }
}
