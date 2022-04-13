import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Cloud_Music/resource/data/musicIcon.dart';
import '../discovery/discovery.dart';
import '../music/music.dart';
import '../personal/personal.dart';
import '../sqaure/sqaure.dart';
import '../follow/follow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  final List _naviTabs = [
    {'icon': NetEaseMusicIcon.search, 'text': '发现'},
    {'icon': NetEaseMusicIcon.podcast, 'text': '播客'},
    {'icon': NetEaseMusicIcon.music, 'text': '我的'},
    {'icon': NetEaseMusicIcon.friend, 'text': '关注'},
    {'icon': NetEaseMusicIcon.sqaure, 'text': '广场'}
  ];

  final List<Widget> _pages = [
    Discovery(),
    Music(),
    Personal(),
    Follow(),
    Square()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: Theme.of(context).primaryColor,
          items: _naviTabs
              .map((tab) => BottomNavigationBarItem(
                  icon: Icon(tab['icon']), title: Text(tab['text'])))
              .toList(),
        ),
        tabBuilder: (BuildContext context, int index) {
          return _pages[index];
        });
  }
}
