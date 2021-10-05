import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double? _logoWidth;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(RouteList.mainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logoWidth = MediaQuery.of(context).size.width * 0.48;
    return Material(
      color: AppColor.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox.shrink(),
          Image.asset(
            ImageConstants.logoSplashImg,
            width: _logoWidth,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Everyone like money, right?',
                style: ThemeText.caption.copyWith(color: AppColor.secondaryColor),
              ),
              SizedBox(
                height: LayoutConstants.paddingVertical58,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
