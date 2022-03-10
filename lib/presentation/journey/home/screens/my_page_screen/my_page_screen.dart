import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/screens/my_page_screen/my_page_screen_constants.dart';

class MyPageScreen extends StatelessWidget {
  MyPageScreen({Key? key}) : super(key: key ?? MyPageScreenConstants.key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("My Page"),
    );
  }
}
