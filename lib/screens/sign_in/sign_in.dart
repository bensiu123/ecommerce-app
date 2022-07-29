import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../shared/default_button.dart';
import '../../shared/form_error.dart';
import '../../shared/input_suffix_icon.dart';
import '../../size_config.dart';

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
          child: Column(
            children: [
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
              const SignForm()
            ],
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
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
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            label: 'Continue',
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
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

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      onSaved: (value) => password = value,
      onChanged: (value) {
        _removeError(value.isNotEmpty, kPasswordNullError);
        _removeError(value.length >= 8, kShortPasswordError);
      },
      validator: (value) {
        if (value == null) {
          _addError(true, kPasswordNullError);
          return null;
        }
        _addError(value.isEmpty, kPasswordNullError);
        _addError(value.length < 8, kShortPasswordError);
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
