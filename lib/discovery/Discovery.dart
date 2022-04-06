import 'package:Cloud_Music/discovery/widget/Carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resource/data/Cloud_Music_Icon.dart';

class Discovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Cloud_Music_Icon.mic), onPressed: () {}),
        title: Text('周杰伦'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[Carousel()],
      ),
    );
  }
}
