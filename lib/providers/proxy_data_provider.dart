import 'package:flutter/material.dart';
import 'package:fluttertest/services/navigation_service.dart';

class ProxyDataProvider extends InheritedWidget {
  const ProxyDataProvider({
    super.key,
    required this.data,
    required super.child,
  });

  final dynamic data;

  static ProxyDataProvider? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ProxyDataProvider>();

  static ProxyDataProvider of(BuildContext context) {
    final ProxyDataProvider? result = maybeOf(context);
    assert(result != null,
        '[ProxyDataProvider.of] No ProxyDataProvider found in context');
    return result!;
  }

  static ProxyDataProvider? get() {
    final context = NavigationService.navigatorKey.currentContext;
    assert(context != null,
        '[ProxyDataProvider.get] No context found in NavigationService');
    final ProxyDataProvider? result = maybeOf(context!);
    assert(result != null,
        '[ProxyDataProvider.get] No ProxyDataProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProxyDataProvider oldWidget) =>
      data != oldWidget.data;
}
