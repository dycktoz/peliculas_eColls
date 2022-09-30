import 'package:flutter/material.dart';
import 'package:peliculas_ecolls/search/search_delegate.dart';
import 'package:peliculas_ecolls/ui/widgets/our_input_decoration.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.3),
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Buenos días',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            onTap: () {
              showSearch(context: context, delegate: MovieSearchDelegate());
            },
            decoration: ourInputDecorator(),
          )
        ],
      ),
    );
  }
}
