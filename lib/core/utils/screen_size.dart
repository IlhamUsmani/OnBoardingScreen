import 'package:flutter/material.dart';

class ScreenSize {
  final BuildContext context;
  late Size _screenSize;
  static late double width,
      height,
      radius,
      fontSize,
      clientHeight,
      topBarSize,
      bottomBarSize;

  ScreenSize(this.context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenSize = mediaQuery.size;
    width = _screenSize.width;
    height = _screenSize.height;
    radius = width * height;
    topBarSize = mediaQuery.padding.top;
    bottomBarSize = mediaQuery.padding.bottom;
    clientHeight = height - kToolbarHeight - kBottomNavigationBarHeight;
    fontSize = (width * 0.8 + height) / 2;
  }
}

double customWidth([double size = 1]) {
  return ScreenSize.width * size;
}

double customHeight([double size = 1]) {
  return ScreenSize.height * size;
}

double customClientHeight([double size = 1]) {
  return ScreenSize.clientHeight * size;
}

double customFontSize([double size = 0.05]) {
  return ScreenSize.fontSize * size;
}
