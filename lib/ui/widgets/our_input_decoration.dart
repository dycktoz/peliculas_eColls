import 'package:flutter/material.dart';

InputDecoration ourInputDecorator(
    {String texto = "", Widget? widget, Color? color, bool isDate = false}) {
  return isDate
      ? InputDecoration(
          hintText: isDate == true ? "texto" : texto,
          labelText: isDate == true ? texto : null,
          labelStyle: const TextStyle(color: Colors.black),
          floatingLabelStyle: const TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
          prefixIcon: widget,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          fillColor: color,
          hintStyle: TextStyle(color: Color.fromARGB(255, 14, 0, 0)),
        )
      : InputDecoration(
          hintText: texto,
          labelText: texto,
          labelStyle: const TextStyle(color: Colors.black),
          floatingLabelStyle: const TextStyle(
              color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
          prefixIcon: widget,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.circular(20.0),

            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 241, 241, 241),
          hintStyle: TextStyle(color: Colors.grey[800]),
        );
}
