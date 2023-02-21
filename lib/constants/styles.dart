import 'package:fluttertest/utilities/scale.dart';

class Styles {
  Styles({
    required this.defaultPadding,
    required this.defaultPaddingVerical,
    required this.defaultButtonHeight,
    required this.defaultInputHeight,
    required this.defaultTabbarHeight,
    required this.defaultTabbarMargin,
    required this.defaultHeaderHeight,
  });

  final double defaultPadding;
  final double defaultPaddingVerical;
  final double defaultButtonHeight;
  final double defaultInputHeight;
  final double defaultTabbarHeight;
  final double defaultTabbarMargin;
  final double defaultHeaderHeight;
}

Styles stylesConstants = Styles(
  defaultPadding: scale(24),
  defaultPaddingVerical: scale(20),
  defaultButtonHeight: scale(48),
  defaultInputHeight: scale(48),
  defaultTabbarHeight: scale(50),
  defaultTabbarMargin: scale(14),
  defaultHeaderHeight: scale(49),
);
