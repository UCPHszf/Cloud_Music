import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class NavigatorUtil {
  static late FluroRouter _router;
  static late NavigatorUtil? _instance;

  NavigatorUtil._internal() {
    _router = FluroRouter();
    _instance = this;
  }

  factory NavigatorUtil() => _instance ?? NavigatorUtil._internal();

  void defineRouters() {}
}
