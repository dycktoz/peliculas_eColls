import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/ui/widgets/labels_widget.dart';
import 'package:peliculas_ecolls/ui/widgets/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          RegisterFormWidget(),
          LabelsWidget(
              ruta: 'login',
              txt: '¿Ya tienes cuenta?',
              txtBt: 'Inicia sesión aqui')
        ],
      ),
    ));
  }
}
