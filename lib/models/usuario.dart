// To parse this JSON data, do
//
//     final usuario = usuarioFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// Usuario usuarioFromMap(String str) => Usuario.fromMap(json.decode(str));

String usuarioToMap(Usuario data) => json.encode(data.toMap());

class Usuario {
  Usuario({
    this.nombre,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.telefono,
    this.estado,
    this.fecha,
    this.genero,
    this.email,
    this.password,
    this.confirmacionpass,
  });

  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;
  String? telefono;
  String? estado;
  String? fecha;
  String? genero;
  String? email;
  String? password;
  String? confirmacionpass;

  Usuario fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombre: json["nombre"],
      apellidoPaterno: json["apellidoPaterno"],
      apellidoMaterno: json["apellidoMaterno"],
      telefono: json["telefono"],
      estado: json["estado"],
      fecha: json["fecha"],
      genero: json["genero"],
      email: json["email"],
      password: json["password"],
      confirmacionpass: json["confirmacionpass"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "nombre": nombre,
      "apellidoPaterno": apellidoPaterno,
      "apellidoMaterno": apellidoMaterno,
      "telefono": telefono,
      "estado": estado,
      "fecha": fecha,
      "genero": genero,
      "email": email,
      "password": password,
      "confirmacionpass": confirmacionpass,
    };
  }

  Usuario fromJsonWithReplace(Map<String, dynamic> json) {
    return Usuario(
      nombre: json['"nombre"'],
      apellidoPaterno: json['"apellidoPaterno"'].replaceAll('"', ""),
      apellidoMaterno: json["apellidoMaterno"].replaceAll('"', ""),
      telefono: json["telefono"].replaceAll('"', ""),
      estado: json["estado"].replaceAll('"', ""),
      fecha: json["fecha"].replaceAll('"', ""),
      genero: json["genero"].replaceAll('"', ""),
      email: json["email"].toDouble().replaceAll('"', ""),
      password: json["password"].replaceAll('"', ""),
      confirmacionpass: json["confirmacionpass"].replaceAll('"', ""),
    );
  }
}
