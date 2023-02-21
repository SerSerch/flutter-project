import 'package:flutter/material.dart';
import 'package:fluttertest/constants/colors.dart';

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar({
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? Colors.black : ColorContants.primary,
          ),
        ),
      ],
    );
  }
}
