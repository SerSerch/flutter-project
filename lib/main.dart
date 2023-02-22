import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/constants/colors.dart';
import 'package:fluttertest/providers/profile_provider.dart';
import 'package:fluttertest/routes/router_config.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ColorContants.bg,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Profile()),
      // Provider(create: (context) => SomeOtherClass()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = routerConfig();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter test',
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
