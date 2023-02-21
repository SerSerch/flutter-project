import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:fluttertest/constants/colors.dart';
import 'package:fluttertest/constants/styles.dart';
import 'package:fluttertest/routes/app_routes.dart';
import 'package:fluttertest/utilities//scale.dart';
import 'package:fluttertest/widgets/nav/bottom_tab_bar_icon.dart';
import 'package:go_router/go_router.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final GoRouterState state;

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  bool isShow = true;

  @override
  void initState() {
    super.initState();
  }

  void _onPressedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        HomeRoute().go(context);
        break;
    }
  }

  static bool _calculateSelected(GoRouterState state, index) {
    final String location = state.location;

    switch (index) {
      case 0:
        return location.startsWith(HomeRoute().location);
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final String location = GoRouterState.of(context).location;

    return Scaffold(
      body: widget.child,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: isShow && !isKeyboardVisible
                  ? stylesConstants.defaultTabbarHeight +
                      stylesConstants.defaultTabbarMargin
                  : 0,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      height: stylesConstants.defaultTabbarHeight,
                      margin: EdgeInsets.only(
                        left: stylesConstants.defaultTabbarMargin,
                        right: stylesConstants.defaultTabbarMargin,
                        bottom: stylesConstants.defaultTabbarMargin,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: scale(8)),
                      decoration: BoxDecoration(
                        color: ColorContants.main.light.withOpacity(0.9),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: ColorContants.primary.withOpacity(0.08),
                            offset: const Offset(0, 4),
                            blurRadius: 16,
                          ),
                          BoxShadow(
                            color: ColorContants.primary.withOpacity(0.08),
                            offset: const Offset(4, 0),
                            blurRadius: 16,
                          ),
                        ],
                        borderRadius:
                            BorderRadius.all(Radius.circular(scale(16))),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(scale(16))),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconBottomBar(
                              text: 'Home',
                              icon: Icons.home,
                              selected: _calculateSelected(widget.state, 0),
                              onPressed: () => _onPressedItem(context, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
