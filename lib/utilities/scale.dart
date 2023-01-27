import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fluttertest/services/navigation_service.dart';

enum DeviceSize { baseWidth, baseHeight }

Map<DeviceSize, int> mobile = const {
  DeviceSize.baseWidth: 375,
  DeviceSize.baseHeight: 812,
};

double scale(num size) {
  final context = NavigationService.navigatorKey.currentContext;
  final deviceData = MediaQuery.of(context!);
  final minSize = math.min(deviceData.size.width, deviceData.size.height);
  final fullWidth = (minSize * deviceData.devicePixelRatio).round();
  final horizontalRatio = fullWidth / mobile[DeviceSize.baseWidth]!;

  return (horizontalRatio * size).round() / deviceData.devicePixelRatio;
}
