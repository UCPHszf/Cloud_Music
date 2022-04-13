import 'package:Cloud_Music/entity/musicList.dart';
import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:Cloud_Music/resource/config/string.dart';
import 'package:Cloud_Music/resource/httpRequest/httpRequest.dart';
import 'package:Cloud_Music/widget/catalog.dart';
import 'package:Cloud_Music/widget/catologTitle.dart';
import 'package:Cloud_Music/widget/musicListWithCoverAndTitle.dart';
import 'package:Cloud_Music/widget/slidingMusicList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendMusicList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecommendMusicListState();
  }
}

class _RecommendMusicListState extends State<RecommendMusicList> {
  List _musicLists = [];

  @override
  void initState() {
    httpRequest.get(StringResource.urlRecommendMusicList,
        queryParameters: {'limit': 30}).then((response) {
      List musicLists = response.data['result']
          .map((musicList) => MusicList(
              musicList['picUrl'],
              musicList['playCount'],
              musicList['name'],
              musicList['copywriter']))
          .toList();
      setState(() {
        _musicLists = musicLists;
      });
      print(_musicLists[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      child: Catalog(
          CatalogTitle(
              Text(
                StringResource.recommendMusicList,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: DimensionConfig.textSmallMediumSize),
              ),
              ElevatedButton(
                child: Text(
                  StringResource.moreWithArrow,
                  style: TextStyle(fontSize: DimensionConfig.textSmallSize),
                ),
                onPressed: () {},
              )),
          Container(
            child: ListView.custom(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: DimensionConfig.musicListPicSpacing),
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                Color? picPrimaryColor;
                // getColorFromUrl(musicList.picUrl)
                //     .then((color) => picPrimaryColor = color);
                if (picPrimaryColor != null) {
                  return MusicListWithCoverAndTitle(
                      _musicLists[index], picPrimaryColor);
                } else {
                  return MusicListWithCoverAndTitle(
                      _musicLists[index], Colors.transparent);
                }
              }, childCount: _musicLists.length),
              semanticChildCount: _musicLists.length,
            ),
            height:
                ScreenUtil().setHeight(DimensionConfig.catalogContentHeight),
          )),
    ));
  }
}
