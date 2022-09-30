import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:peliculas_ecolls/forms/login_form_bloc.dart';
import 'package:peliculas_ecolls/ui/widgets/our_input_decoration.dart';

class LoginFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = context.read<LoginFormBloc>();

          return Container(
            child: FormBlocListener<LoginFormBloc, String, String>(
              onSubmitting: (context, state) {},
              onSubmissionFailed: (context, state) {},
              onSuccess: (context, state) {},
              onFailure: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.failureResponse!)));
              },
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 100),
                  child: Column(
                    children: <Widget>[
                      Text('Inicia sesión',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      _space(heigh: 80),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.email,
                          keyboardType: TextInputType.multiline,
                          decoration: ourInputDecorator(texto: 'Email')),
                      _space(),
                      TextFieldBlocBuilder(
                          textFieldBloc: formBloc.password,
                          suffixButton: SuffixButton.asyncValidating,
                          keyboardType: TextInputType.emailAddress,
                          decoration: ourInputDecorator(texto: 'Contraseña')),
                      _space(heigh: 30),
                      MaterialButton(
                          color:
                              Color.fromARGB(255, 52, 52, 52).withOpacity(0.3),
                          elevation: 0,
                          disabledColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 60),
                            child: const Text(
                              'Iniciar Sesión',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                          onPressed: () {
                            // LoginFormBloc().onSubmitting();
                            Navigator.of(context).pushReplacementNamed('home');
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
