import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'custom_colors.dart';

class Loader {
  static void setup() {
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.circle;
    EasyLoading.instance.indicatorSize = 45.0;
    EasyLoading.instance.radius = 10.0;
    EasyLoading.instance.progressColor = Colors.white;
    EasyLoading.instance.backgroundColor = CustomColors.primary;
    EasyLoading.instance.indicatorColor = Colors.white;
    EasyLoading.instance.textColor = Colors.white;
    EasyLoading.instance.maskColor = CustomColors.secondary.withOpacity(0.5);
    EasyLoading.instance.userInteractions = false;
    EasyLoading.instance.dismissOnTap = false;
    EasyLoading.instance.maskType = EasyLoadingMaskType.custom;
  }
}