import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );

  LoginFormBloc() {
    addFieldBlocs(fieldBlocs: [email, password]);
  }

  static String? _min4Char(String? username) {
    if (username!.length < 5) {
      return 'The username must have at least 5 characters';
    }
    return null;
  }

  @override
  void onSubmitting() async {
    debugPrint(password.value.toString());

    try {
      await Future<void>.delayed(const Duration(milliseconds: 500));

      emitSuccess();
    } catch (e) {
      emitFailure();
    }
  }
}
