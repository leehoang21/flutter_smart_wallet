import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/bloc/splash_bloc.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double? _logoWidth;
  SplashBloc _splashBloc = SplashBloc();
  @override
  void initState() {
    _splashBloc.initiaal();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, RouteList.createTransaction);
    });
    super.initState();
  }

  @override
  void dispose() {
    _splashBloc.close();
    super.dispose();
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
          const SizedBox.shrink(),
          Image.asset(
            ImageConstants.logoSplashImg,
            width: _logoWidth,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Everyone like money, right?',
                style:
                    ThemeText.caption.copyWith(color: AppColor.secondaryColor),
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
