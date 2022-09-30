import 'package:flutter/material.dart';

class LabelsWidget extends StatelessWidget {
  final String ruta;
  final String txt;
  final String txtBt;

  const LabelsWidget(
      {Key? key, required this.ruta, required this.txt, required this.txtBt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Text(
            txt,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              txtBt,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          )
        ],
      ),
    );
  }
}
