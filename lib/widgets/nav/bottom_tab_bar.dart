import 'package:flutter/material.dart';
import 'package:fluttertest/constants/colors.dart';
import 'package:fluttertest/constants/styles.dart';
import 'package:fluttertest/routes/app_routes.dart';
import 'package:fluttertest/utilities//scale.dart';
import 'package:go_router/go_router.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final GoRouterState state;

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
      body: child,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          height: stylesConstants.defaultTabbarHeight,
          margin: EdgeInsets.only(
            left: stylesConstants.defaultTabbarMargin,
            right: stylesConstants.defaultTabbarMargin,
            bottom: stylesConstants.defaultTabbarMargin,
          ),
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
            borderRadius: BorderRadius.all(Radius.circular(scale(16))),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(scale(16))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconBottomBar(
                  text: 'Home',
                  icon: Icons.home,
                  selected: _calculateSelected(state, 0),
                  onPressed: () => _onPressedItem(context, 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
        // Text(
        //   text,
        //   style: TextStyle(
        //       fontSize: 12, color: selected ? Colors.black : Colors.blue),
        // )
      ],
    );
  }
}
