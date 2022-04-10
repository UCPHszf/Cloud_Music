import 'package:Cloud_Music/resource/config/dimension.dart';
import 'package:flutter/material.dart';

class CatalogTitle extends StatelessWidget {
  final Widget _leftWidget;
  final String _rightText;

  CatalogTitle(this._leftWidget, this._rightText);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      child: Row(
        children: <Widget>[
          _leftWidget,
          Spacer(),
          TextButton(onPressed: () {}, child: Text('$_rightText>'))
        ],
      ),
      padding: EdgeInsets.symmetric(
          horizontal: DimensionConfig.discoveryPageCatalogHorizonSpacing),
    ));
  }
}
