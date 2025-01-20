import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeBreakpoints {
  // UP
  static bool xsUp(BuildContext context){
    return MediaQuery.of(context).size.width >= 480;
  }
  static bool smUp(BuildContext context){
    return MediaQuery.of(context).size.width >= 600;
  }
  static bool mdUp(BuildContext context){
    return MediaQuery.of(context).size.width >= 960;
  }
  static bool lgUp(BuildContext context){
    return MediaQuery.of(context).size.width >= 1280;
  }
  static bool xlUp(BuildContext context){
    return MediaQuery.of(context).size.width >= 1536;
  }

  // Down
  static bool xsDown(BuildContext context){
    return MediaQuery.of(context).size.width < 480;
  }
  static bool smDown(BuildContext context){
    return MediaQuery.of(context).size.width < 600;
  }
  static bool mdDown(BuildContext context){
    return MediaQuery.of(context).size.width < 960;
  }
  static bool lgDown(BuildContext context){
    return MediaQuery.of(context).size.width < 1280;
  }
  static bool xlDown(BuildContext context){
    return MediaQuery.of(context).size.width < 1536;
  }
}

class ThemeConstraint {
  // Up
  static bool xsUp(double constraint){
    return constraint >= 480;
  }
  static bool smUp(double constraint){
    return constraint >= 600;
  }
  static bool mdUp(double constraint){
    return constraint >= 960;
  }
  static bool lgUp(double constraint){
    return constraint >= 1280;
  }
  static bool xlUp(double constraint){
    return constraint >= 1536;
  }

  // Down
  static bool xsDown(double constraint){
    return constraint < 480;
  }
  static bool smDown(double constraint){
    return constraint < 600;
  }
  static bool mdDown(double constraint){
    return constraint < 960;
  }
  static bool lgDown(double constraint){
    return constraint < 1280;
  }
  static bool xlDown(double constraint){
    return constraint < 1536;
  }
}