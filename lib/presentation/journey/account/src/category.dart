import 'package:flutter/material.dart';

class Categori extends StatelessWidget {
  Categori(
      {Key? key,
      required this.pathImage,
      required this.title,
      required this.action})
      : super(key: key);
  String title;
  String pathImage;
  Function action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            leading: Expanded(child: Image.asset(pathImage)),
          ),
          flex: 3,
        ),
        Expanded(
          child: TextButton(
            child: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              action;
            },
          ),
          flex: 1,
        ),
      ],
    );
  }
}
