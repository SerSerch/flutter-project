import 'package:flutter/material.dart';
import 'package:fluttertest/constants/colors.dart';
import 'package:fluttertest/constants/styles.dart';
import 'package:fluttertest/services/navigation_service.dart';
import 'package:fluttertest/utilities/scale.dart';

class SnackService {
  static Future<void> showSnack({String text = ''}) async {
    try {
      final BuildContext context =
          NavigationService.navigatorKey.currentContext!;

      final snackBar = SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: ColorContants.primary),
            ),
          ],
        ),
        duration: const Duration(seconds: 5),
        dismissDirection:
            DismissDirection.horizontal, // направление закрытия жестом
        // action: SnackBarAction(
        //   label: 'Undo',
        //   onPressed: () {},
        // ),
        // showCloseIcon: true,
        // animation: ,
        // width: scale(280),
        backgroundColor: ColorContants.neutral.purple,
        padding: EdgeInsets.all(scale(8)),
        margin: EdgeInsets.symmetric(
            horizontal: stylesConstants.defaultPadding, vertical: scale(4)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(scale(20)),
        ),
        behavior: SnackBarBehavior.floating, // расположение
        // clipBehavior: Clip.hardEdge,
        elevation: 2, // тень
        // onVisible: () {}, // первый раз видимый
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (error) {
      debugPrint('error showSnack $error');
    }
  }
}
