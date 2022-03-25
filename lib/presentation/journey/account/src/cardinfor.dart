import 'package:flutter/material.dart';

class CardInfor extends StatelessWidget {
  CardInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'David Teo',
        style: TextStyle(fontSize: 25),
      ),
      subtitle: ListTile(
        title: Text('davidteo@gmail.com'),
        subtitle: Text('035 345 8000'),
      ),
    );
  }
}
