import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertest/constants/colors.dart';
import 'package:fluttertest/services/navigation_service.dart';
import 'package:fluttertest/utilities/scale.dart';

class ModalService {
  static Future<void> showModal({
    required Widget child,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    MainAxisSize size = MainAxisSize.min,
    double? borderRadius,
    double? top,
    double? minHeight,
    double? maxHeight,
  }) async {
    try {
      final BuildContext navigationContext =
          NavigationService.navigatorKey.currentContext!;
      final deviceData = MediaQuery.of(navigationContext);
      double topMargin = top ?? scale(20);
      double topDevice = deviceData.padding.top;
      double bottomDevice = deviceData.padding.bottom;
      double maxModalHeight = deviceData.size.height - topDevice - topMargin;
      double minModalHeight = minHeight != null
          ? minHeight < maxModalHeight
              ? minHeight
              : maxModalHeight
          : scale(44);
      double radius = borderRadius ?? scale(40);

      if (maxHeight != null && maxHeight < maxModalHeight) {
        maxModalHeight = maxHeight;
      }

      return showModalBottomSheet(
        context: navigationContext,
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        useRootNavigator: true,
        useSafeArea: false, // don't use it
        // transitionAnimationController: ,
        // elevation: ,
        constraints: BoxConstraints(
          minHeight: minModalHeight,
          maxHeight: maxModalHeight,
        ),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
        ),
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                bottom:
                    bottomDevice + MediaQuery.of(context).viewInsets.bottom),
            color: ColorContants.main.light,
            child: Column(
              mainAxisSize: size,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: scale(44),
                  padding: EdgeInsets.only(top: scale(16)),
                  child: Container(
                    height: scale(4),
                    width: scale(64),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: ColorContants.neutral.light_dark,
                    ),
                  ),
                ),
                Flexible(
                  flex: size == MainAxisSize.max ? 1 : 0,
                  child: child,
                ),
              ],
            ),
          );
        },
      );
    } catch (error) {
      debugPrint('error showModal $error');
    }
  }
}
