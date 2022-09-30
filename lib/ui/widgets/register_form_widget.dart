import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:peliculas_ecolls/forms/login_form_bloc.dart';
import 'package:peliculas_ecolls/forms/register_form_bloc.dart';
import 'package:peliculas_ecolls/sqflite/app_basedatos.dart';
import 'package:peliculas_ecolls/ui/widgets/our_input_decoration.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<RegisterFormBloc>();

          return Container(
            child: FormBlocListener<RegisterFormBloc, String, String>(
              onSubmitting: (context, state) {
                LoadingDialog.show(context);
              },
              onSubmissionFailed: (context, state) {
                LoadingDialog.hide(context);
              },
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
              },
              onFailure: (context, state) {
                LoadingDialog.hide(context);

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.failureResponse!)));
              },
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                  child: Column(
                    children: <Widget>[
                      Text('Vamos a crear tu cuenta',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.nombre,
                          keyboardType: TextInputType.multiline,
                          decoration: ourInputDecorator(texto: 'Nombre')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.apellidoPaterno,
                          keyboardType: TextInputType.multiline,
                          decoration:
                              ourInputDecorator(texto: 'Apellido Paterno')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.apellidoMaterno,
                          keyboardType: TextInputType.multiline,
                          decoration:
                              ourInputDecorator(texto: 'Apellido Materno')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.telefono,
                          keyboardType: TextInputType.multiline,
                          decoration: ourInputDecorator(texto: 'Telefono')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.estado,
                          keyboardType: TextInputType.multiline,
                          decoration: ourInputDecorator(texto: 'Estado')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.fecha,
                          keyboardType: TextInputType.multiline,
                          decoration:
                              ourInputDecorator(texto: 'Fecha de Nacimiento')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.genero,
                          keyboardType: TextInputType.multiline,
                          decoration: ourInputDecorator(texto: 'Genero')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.email,
                          keyboardType: TextInputType.multiline,
                          decoration: ourInputDecorator(texto: 'Email')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.password,
                          keyboardType: TextInputType.multiline,
                          decoration: ourInputDecorator(
                              texto: 'Establece una contraseña')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.confirmacionpass,
                          suffixButton: SuffixButton.asyncValidating,
                          keyboardType: TextInputType.emailAddress,
                          decoration: ourInputDecorator(
                              texto: 'Ingresa nuevamente la contraseña')),
                      _space(heigh: 30),
                      MaterialButton(
                          color: Color.fromARGB(255, 52, 52, 52),
                          elevation: 0,
                          disabledColor:
                              Color.fromARGB(255, 52, 52, 52).withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 60),
                            child: const Text(
                              'Crear cuenta',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('login');
                            // formBloc.onSubmitting();
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _space({double heigh = 20}) {
    return SizedBox(
      height: heigh,
    );
  }
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(12.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
