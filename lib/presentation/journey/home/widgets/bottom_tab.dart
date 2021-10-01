import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/controller/home_controller.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../home_screen_constants.dart';

class BottomTabHome extends StatelessWidget {
  final _bottomShadows = BoxShadow(
      color: AppColor.primaryColor, blurRadius: 10, offset: Offset(0.0, 3.0));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomCenter, child: _shadowsOfCreateButton()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[_bottomShadows],
              color: Colors.white,
            ),
            height: HomeScreenConstants.heightTab,
            child: _tabs(),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: _createExpenseButton(context))
      ],
    );
  }

  Widget _shadowsOfCreateButton() {
    return Padding(
        padding: EdgeInsets.only(
            bottom: HomeScreenConstants.centerButtonPaddingBottom),
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[_bottomShadows],
            color: Colors.white,
          ),
        ));
  }

  Widget _createExpenseButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: HomeScreenConstants.centerButtonPaddingBottom),
      child: GestureDetector(
        onTap: () => _onPressedBtnAdd(context),
        child: Container(
          height: 56,
          width: 56,
          child: SvgPicture.asset(
            IconConstants.floatingBtnIcon,
          ),
        ),
      ),
    );
  }

  Widget _tabs() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _tabItem(SvgPicture.asset(IconConstants.transactionIcon),
                  () => _tabClicked(0)),
              _tabItem(SvgPicture.asset(IconConstants.reportIcon),
                  () => _tabClicked(1)),
            ],
          ),
          Row(
            children: [
              _tabItem(SvgPicture.asset(IconConstants.planIcon),
                  () => _tabClicked(2)),
              _tabItem(SvgPicture.asset(IconConstants.myPageIcon),
                  () => _tabClicked(3)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tabItem(Widget icon, Function onClicked) {
    double bottomPadding = HomeScreenConstants.iconTabPaddingBottomAndroid;
    if (Platform.isIOS)
      bottomPadding = HomeScreenConstants.iconTabPaddingBottomIOS;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onClicked();
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        width: HomeScreenConstants.widthChildTab,
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: icon,
      ),
    );
  }

  void _tabClicked(int index) {
    Get.find<HomeController>().changeTab(index);
    print('click tab $index');
  }

  void _onPressedBtnAdd(BuildContext context) {}
}
