import 'package:flutter/cupertino.dart';

class WrapUtil {
  static WrapUtil? _instance;

  WrapUtil._internal() {
    _instance = this;
  }

  factory WrapUtil() => _instance ?? WrapUtil._internal();

  Widget wrapInSilver(Widget widget) {
    return SliverToBoxAdapter(
      child: widget,
    );
  }
}
