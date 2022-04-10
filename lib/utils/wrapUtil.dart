import 'package:flutter/cupertino.dart';

class WrapUtil {
  static Widget wrapInSilver(Widget widget) {
    return SliverToBoxAdapter(
      child: widget,
    );
  }
}
