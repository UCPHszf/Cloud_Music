import 'dart:async';
import 'package:Cloud_Music/entity/bannerItem.dart';
import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:Cloud_Music/resource/config/string.dart';
import 'package:flutter/material.dart';
import 'package:Cloud_Music/resource/httpRequest/httpRequest.dart';

class Carousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _carouselState();
  }
}

class _carouselState extends State<Carousel> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIdx = 1;
  Timer? _timer;
  List _banners = [];
  List _inftyBanners = [];

  @override
  void initState() {
    // var d = new Dio(new BaseOptions(baseUrl: 'http://192.168.8.100:3000/'));
    // var tmp = d.get('banner', queryParameters: {'type': 2});
    // print(tmp);
    httpRequest.get(StringResource.urlBanner, queryParameters: {'type': 2}).then(
        (response) {
      List banners = response.data['banners']
          .map((banner) => BannerItem(pic: banner['pic']))
          .toList();
      setState(() {
        _banners = banners;
      });
    }).then((_) {
      List inftyBanners = []
        ..add(_banners[_banners.length - 1])
        ..addAll(_banners)
        ..add(_banners[0]);
      setState(() {
        _inftyBanners = inftyBanners;
      });
    });
    _setTimer();
    super.initState();
  }

  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) {
      _pageController.animateToPage(_currentIdx + 1,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: AspectRatio(
            aspectRatio: 2.5,
            child: Stack(
              children: <Widget>[
                PageView(
                  controller: _pageController,
                  onPageChanged: (page) {
                    int targetIdx;
                    if (page == _inftyBanners.length - 1) {
                      targetIdx = 1;
                      _pageController.jumpToPage(targetIdx);
                    } else if (page == 0) {
                      targetIdx = _inftyBanners.length - 2;
                      _pageController.jumpToPage(targetIdx);
                    } else {
                      targetIdx = page;
                    }
                    setState(() {
                      _currentIdx = targetIdx;
                    });
                  },
                  children: _inftyBanners
                      .map((item) => Container(
                            margin: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(DimensionConfig.smallBorderRadius),
                              child: Image.network(
                                item.pic,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _banners
                        .asMap()
                        .map((idx, val) => MapEntry(
                            idx,
                            Container(
                              width: 6.0,
                              height: 6.0,
                              margin: EdgeInsets.only(left: 2.0, right: 2.0),
                              decoration: BoxDecoration(
                                  color: _currentIdx == idx + 1
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                  shape: BoxShape.circle),
                            )))
                        .values
                        .toList(),
                  ),
                )
              ],
            )));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
