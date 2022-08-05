import 'package:flutter/material.dart';

import '../../shared/default_button.dart';
import '../../size_config.dart';

class SignInSuccessScreen extends StatelessWidget {
  static String routeName = '/sign_in_success';

  const SignInSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('Sign In Success'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/success.png',
          height: SizeConfig.screenHeight * 0.4,
        ),
        const Spacer(),
        Text(
          'Sign in Success',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            label: 'Back to Home',
            onPressed: () {},
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
