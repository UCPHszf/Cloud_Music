import 'package:Cloud_Music/resource/config/color.dart';
import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:Cloud_Music/resource/data/musicIcon.dart';
import 'package:Cloud_Music/widget/blankRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageDiscoveryCatalog extends StatelessWidget {
  List _catalogs = [
    {'icon': Cloud_Music_Icon.date_1, 'text': '每日推荐'},
    {'icon': Cloud_Music_Icon.personalFM, 'text': '私人FM'},
    {'icon': Cloud_Music_Icon.musicList, 'text': '歌单'},
    {'icon': Cloud_Music_Icon.ranking, 'text': '排行榜'},
    {'icon': Cloud_Music_Icon.liveStreaming, 'text': '直播'},
    {'icon': Cloud_Music_Icon.digitalAlbum, 'text': '数字专辑'},
    {'icon': Cloud_Music_Icon.sleepAid, 'text': '助眠解压'},
    {'icon': Cloud_Music_Icon.karaokeRoom, 'text': '歌房'},
    {'icon': Cloud_Music_Icon.gameZone, 'text': '游戏专区'}
  ];

  var width = ScreenUtil().setWidth(DimensionConfig.defaultBasicIconWidth);
  var height = ScreenUtil().setHeight(DimensionConfig.defaultBasicIconHeight);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil().setHeight(150),
        child: ListView.custom(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            width: width,
                            height: height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width / 2),
                              border:
                                  Border.all(color: Colors.black12, width: 0.5),
                              color: ColorConfig.icon_bg,
                            ),
                          ),
                          Icon(
                            _catalogs[index]['icon'],
                          ),
                        ],
                      ),
                      BlankRow(10),
                      Text('${_catalogs[index]['text']}',
                          style: TextStyle(
                              color: ColorConfig.icon_text_bg,
                              fontSize: DimensionConfig.textSmallSize))
                    ],
                  ),
                ));
          }, childCount: _catalogs.length),
        ),
      ),
    );
  }
}
