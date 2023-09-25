import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Categori extends StatelessWidget {
  Categori({
    Key? key,
    required this.pathImage,
    required this.title,
    required this.action,
  }) : super(key: key);
  String title;
  String pathImage;
  Function() action;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      leading: Image.asset(pathImage),
      trailing: TextButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: action,
      ),
    );
  }
}
