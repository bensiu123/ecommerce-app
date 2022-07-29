import 'routes.dart';
import 'package:flutter/material.dart';

import 'screens/splash/splash.dart';
import 'size_config.dart';
import 'theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp(
      title: 'E-Commerce Flutter Demo',
      theme: theme,
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
