import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../shared/default_button.dart';
import '../../shared/form_error.dart';
import '../../shared/input_suffix_icon.dart';
import '../../shared/no_account_text.dart';
import '../../size_config.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = '/forgot_password';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
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
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Please enter your email and we will send\nyou a link to return to your account',
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  const ForgotPasswordForm(),
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

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  final List<String> errors = [];

  void _addError(bool condition, String error) {
    if (condition && !errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void _removeError(bool condition, String error) {
    if (condition && errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            label: 'Continue',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => email = value,
      onChanged: (value) {
        _removeError(value.isNotEmpty, kEmailNullError);
        _removeError(
          emailValidatorRegExp.hasMatch(value),
          kInvalidEmailError,
        );
      },
      validator: (value) {
        if (value == null) {
          _addError(true, kEmailNullError);
          return null;
        }
        _addError(value.isEmpty, kEmailNullError);
        _addError(
          !emailValidatorRegExp.hasMatch(value),
          kInvalidEmailError,
        );
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        suffixIcon: InputSuffixIcon(
          svgIcon: 'assets/icons/Mail.svg',
        ),
      ),
    );
  }
}
