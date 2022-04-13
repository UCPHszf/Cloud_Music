import 'package:Cloud_Music/resource/config/color.dart';
import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:Cloud_Music/resource/data/musicIcon.dart';
import 'package:Cloud_Music/widget/blankRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendCatalog extends StatelessWidget {
  List _catalogs = [
    {'icon': NetEaseMusicIcon.date_1, 'text': '每日推荐'},
    {'icon': NetEaseMusicIcon.personalFM, 'text': '私人FM'},
    {'icon': NetEaseMusicIcon.musicList, 'text': '歌单'},
    {'icon': NetEaseMusicIcon.ranking, 'text': '排行榜'},
    {'icon': NetEaseMusicIcon.liveStreaming, 'text': '直播'},
    {'icon': NetEaseMusicIcon.digitalAlbum, 'text': '数字专辑'},
    {'icon': NetEaseMusicIcon.sleepAid, 'text': '助眠解压'},
    {'icon': NetEaseMusicIcon.karaokeRoom, 'text': '歌房'},
    {'icon': NetEaseMusicIcon.gameZone, 'text': '游戏专区'}
  ];

  var width = ScreenUtil().setWidth(DimensionConfig.defaultBasicIconWidth);
  var height = ScreenUtil().setHeight(DimensionConfig.defaultBasicIconHeight);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil().setHeight(100),
        child: ListView.custom(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
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
                      BlankRow(DimensionConfig.musicListPicTextSpacing),
                      Text('${_catalogs[index]['text']}',
                          style: TextStyle(
                              color: ColorConfig.icon_text,
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
