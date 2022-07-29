import 'routes.dart';
import 'package:flutter/material.dart';

import 'screens/sign_in/sign_in.dart';
import 'screens/splash/splash.dart';
import 'theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Flutter Demo',
      theme: theme,
      routes: routes,
      initialRoute: SignInScreen.routeName,
    );
  }
}
