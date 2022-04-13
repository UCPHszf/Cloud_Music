import 'package:Cloud_Music/resource/config/color.dart';
import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:Cloud_Music/resource/data/musicIcon.dart';
import 'package:flutter/material.dart';

class PlayCountView extends StatelessWidget {
  final String playCount;
  final Color decorationColor;

  PlayCountView(this.playCount, this.decorationColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
                  BorderRadius.circular(DimensionConfig.mediumBorderRadius),
              color: decorationColor),
          child: Row(
            children: [
              Icon(NetEaseMusicIcon.play),
              Text(
                playCount,
                style: TextStyle(
                    fontSize: DimensionConfig.textMiniSize,
                    color: ColorConfig.white),
              )
            ],
            mainAxisSize: MainAxisSize.min,
          )),
    );
  }
}
