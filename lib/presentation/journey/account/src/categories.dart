import 'package:flutter/material.dart';

import 'category.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Categori(
            pathImage: 'assets/icons/categories.png',
            title: 'Category',
            action: () {}),
        Categori(
            pathImage: 'assets/icons/language.png',
            title: 'Language',
            action: () {}),
        Categori(
            pathImage: 'assets/icons/rateme.png',
            title: 'Rate me',
            action: () {}),
        Categori(
            pathImage: 'assets/icons/aboutme.png',
            title: 'About me',
            action: () {}),
        Categori(
            pathImage: 'assets/icons/logout.png',
            title: 'Logout',
            action: () {}),
      ],
    );
  }
}
