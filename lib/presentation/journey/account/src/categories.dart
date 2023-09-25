import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/cubit/account_cubit.dart';

import '../../../../common/constants/route_list.dart';
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
          action: () {
            context.read<AccountCubit>().signOut();
            Navigator.pushNamed(context, RouteList.loginScreen);
          },
        ),
      ],
    );
  }
}
