import 'package:Cloud_Music/entity/musicList.dart';
import 'package:Cloud_Music/resource/config/color.dart';
import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:Cloud_Music/utils/numUtil.dart';
import 'package:Cloud_Music/widget/blankRow.dart';
import 'package:Cloud_Music/widget/playCountView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicListWithCoverAndTitle extends StatelessWidget {
  final MusicList _musicList;
  final Color? playCountBgColor;

  MusicListWithCoverAndTitle(this._musicList, this.playCountBgColor);

  @override
  Widget build(BuildContext context) {
    String playCount =
        NumUtil.instance.transferPlayCountToString(_musicList.playCount);
    return Container(
      width: ScreenUtil().setWidth(DimensionConfig.picSize),
      margin: EdgeInsets.symmetric(
          horizontal:
              ScreenUtil().setWidth(DimensionConfig.musicListPicSpacing)),
      child: Column(
        children: <Widget>[
          Container(
            child: AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: PlayCountView(
                          playCount, playCountBgColor ?? Colors.transparent),
                    ),
                    Image.network(_musicList.picUrl)
                  ],
                )),
            height: ScreenUtil().setHeight(DimensionConfig.picSize),
          ),
          BlankRow(DimensionConfig.musicListPicTextSpacing),
          Text(
            _musicList.name,
            style: TextStyle(
                fontSize: DimensionConfig.textSmallSize,
                color: ColorConfig.black),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
        //crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
