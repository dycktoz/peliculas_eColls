import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:peliculas_ecolls/sqflite/app_basedatos.dart';

class RegisterFormBloc extends FormBloc<String, String> {
  final nombre = TextFieldBloc(
    name: 'nombre',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final apellidoPaterno = TextFieldBloc(
    name: 'apellidoPaterno',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final apellidoMaterno = TextFieldBloc(
    name: 'apellidoMaterno',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final telefono = TextFieldBloc(
    name: 'telefono',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final estado = TextFieldBloc(
    name: 'estado',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final fecha = TextFieldBloc(
    name: 'fecha',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final genero = TextFieldBloc(
    name: 'genero',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final email = TextFieldBloc(
    name: 'email',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final password = TextFieldBloc(
    name: 'password',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );
  final confirmacionpass = TextFieldBloc(
    name: 'confirmacionpass',
    validators: [
      FieldBlocValidators.required,
      _min4Char,
    ],
    asyncValidatorDebounceTime: const Duration(milliseconds: 300),
  );

  RegisterFormBloc() {
    addFieldBlocs(fieldBlocs: [
      nombre,
      apellidoPaterno,
      apellidoMaterno,
      telefono,
      estado,
      fecha,
      genero,
      email,
      password,
      confirmacionpass
    ]);
  }

  static String? _min4Char(String? username) {
    if (username!.length < 5) {
      return 'The username must have at least 5 characters';
    }
    return null;
  }

  @override
  void onSubmitting() async {
    Map<String, dynamic> register = {
      "nombre": nombre.value,
      "apellidoPaterno": apellidoPaterno.value,
      "apellidoMaterno": apellidoMaterno.value,
      "telefono": telefono.value,
      "estado": estado.value,
      "fecha": fecha.value,
      "genero": genero.value,
      "email": email.value,
      "password": password.value,
      "confirmacionpass": confirmacionpass.value,
    };
    await DB.saveUsuario(json: register);
  }
}
