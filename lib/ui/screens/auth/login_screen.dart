import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/ui/widgets/labels_widget.dart';
import 'package:peliculas_ecolls/ui/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          LoginFormWidget(),
          LabelsWidget(
              ruta: 'register',
              txt: '¿No tienes cuenta?',
              txtBt: 'Crea una ahora')
        ],
      ),
    ));
  }
}
