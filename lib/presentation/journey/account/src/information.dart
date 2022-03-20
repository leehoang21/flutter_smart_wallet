import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'avata.dart';
import 'cardinfor.dart';

class Information extends StatelessWidget {
  Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Avata(),
            flex: 1,
          ),
          Expanded(
            child: CardInfor(),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
