import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resource/data/Cloud_Music_Icon.dart';
import '../discovery/Discovery.dart';
import '../music/Music.dart';
import '../personal/Personal.dart';
import '../sqaure/Square.dart';
import '../follow/Follow.dart';

class Home extends StatelessWidget {
  final List _naviTabs = [
    {'icon': Cloud_Music_Icon.search, 'text': '发现'},
    {'icon': Cloud_Music_Icon.music, 'text': '音乐'},
    {'icon': Cloud_Music_Icon.personal, 'text': '我的'},
    {'icon': Cloud_Music_Icon.friend, 'text': '关注'},
    {'icon': Cloud_Music_Icon.sqaure, 'text': '广场'}
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
