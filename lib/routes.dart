import 'package:flutter/material.dart';

import 'screens/forgot_password/forgot_password.dart';
import 'screens/sign_in/sign_in.dart';
import 'screens/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
};
