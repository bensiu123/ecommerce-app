import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../shared/default_button.dart';
import '../../shared/form_error.dart';
import '../../shared/input_suffix_icon.dart';
import '../../size_config.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  final List<String> errors = [];

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
}
