import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../shared/default_button.dart';
import '../../shared/form_error.dart';
import '../../shared/input_suffix_icon.dart';
import '../../size_config.dart';
import '../forgot_password/forgot_password.dart';
import '../sign_in_success/sign_in_success.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final List<String> errors = [];
  bool rememberMe = false;

  String _addError(String error) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
    return error;
  }

  void _removeError(String error) {
    if (errors.contains(error)) {
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
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    rememberMe = value ?? false;
                  });
                },
              ),
              const Text('Remember me'),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            label: 'Continue',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                Navigator.pushNamed(context, SignInSuccessScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => email = value,
      onChanged: (value) {
        if (value.isNotEmpty) _removeError(kEmailNullError);
        if (emailValidatorRegExp.hasMatch(value)) {
          _removeError(kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value == null) {
          return _addError(kEmailNullError);
        }
        if (value.isEmpty) {
          return _addError(kEmailNullError);
        }
        if (!emailValidatorRegExp.hasMatch(value)) {
          return _addError(kInvalidEmailError);
        }

        // return null if no error
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      onSaved: (value) => password = value,
      onChanged: (value) {
        if (value.isNotEmpty) _removeError(kPasswordNullError);
        if (value.length >= 8) {
          _removeError(kShortPasswordError);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _addError(kPasswordNullError);
        }
        if (value.length < 8) {
          return _addError(kShortPasswordError);
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: InputSuffixIcon(
          svgIcon: 'assets/icons/Lock.svg',
        ),
      ),
    );
  }
}
