import 'package:flutter/material.dart';

import '../../shared/no_account_text.dart';
import '../../shared/social_button.dart';
import '../../size_config.dart';
import 'sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/sign_in';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: SizedBox(
              height: SizeConfig.screenHeight * 0.8,
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Sign in with your email and password\nor continue with social media',
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  const SignInForm(),
                  const Spacer(
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        icon: 'assets/icons/google-icon.svg',
                        onPressed: () {},
                      ),
                      SocialButton(
                        icon: 'assets/icons/facebook-2.svg',
                        onPressed: () {},
                      ),
                      SocialButton(
                        icon: 'assets/icons/twitter.svg',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Spacer(),
                  const NoAccountText(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
