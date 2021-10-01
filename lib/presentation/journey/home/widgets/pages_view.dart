import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/controller/home_controller.dart';
import 'package:flutter_smart_wallet/presentation/journey/profile/profile_screen.dart';
import 'package:get/get.dart';

import '../home_screen_constants.dart';

class PagesViewHome extends StatefulWidget {
  @override
  _PagesViewHomeState createState() => _PagesViewHomeState();
}

class _PagesViewHomeState extends State<PagesViewHome> {
  final _indexTab = Get.find<HomeController>().indexTab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: Obx(() {
            return IndexedStack(
              index: _indexTab.value,
              children: [
                Center(child: Text('page 1')),
                Center(child: Text('page 2')),
                Center(child: Text('page 3')),
                ProfileScreen(),
              ],
            );
          })),
          SizedBox(
            height: HomeScreenConstants.heightTab,
          )
        ],
      ),
    );
  }
}
