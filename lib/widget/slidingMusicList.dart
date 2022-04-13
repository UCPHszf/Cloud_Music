import 'dart:async';

import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blankRow.dart';

class SlidingMusicList extends StatefulWidget {
  final List sliding;

  SlidingMusicList(this.sliding);

  @override
  State<StatefulWidget> createState() {
    return SlidingMusicListState(sliding);
  }
}

class SlidingMusicListState extends State<SlidingMusicList> {
  final List _slidingMusicList;
  Timer? _timer;
  PageController _pageController = PageController(initialPage: 0);
  int _currentIdx = 1;

  SlidingMusicListState(this._slidingMusicList);

  void _setTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 3), (_) {
        _pageController.animateToPage(_currentIdx + 1,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    }
  }

  @override
  void initState() {
    _setTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List _inftySlidingMusicList = []
      ..add(_slidingMusicList[_slidingMusicList.length - 1])
      ..addAll(_slidingMusicList)
      ..add(_slidingMusicList[0]);
    return Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
            ),
            PageView(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              onPageChanged: (page) {
                int targetIdx;
                if (page == _inftySlidingMusicList.length - 1) {
                  targetIdx = 1;
                  _pageController.jumpToPage(targetIdx);
                } else if (page == 0) {
                  targetIdx = _inftySlidingMusicList.length - 2;
                  _pageController.jumpToPage(targetIdx);
                } else {
                  targetIdx = page;
                }
                setState(() {
                  _currentIdx = targetIdx;
                });
              },
              children: _inftySlidingMusicList
                  .map((musicList) => Container(
                        child: Column(
                          children: [
                            AspectRatio(
                                aspectRatio: 1.0,
                                child: Image.network(musicList.picUrl)),
                            BlankRow(DimensionConfig.musicListPicTextSpacing),
                            Container(
                              child: Text(
                                musicList.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: DimensionConfig.textSmallSize),
                              ),
                              margin: EdgeInsets.only(
                                  top: DimensionConfig.musicListPicTextSpacing),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
        width: ScreenUtil().setWidth(DimensionConfig.picSize));
  }
}
