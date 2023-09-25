import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/bloc/splash_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/bloc/splash_state.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double? _logoWidth;
  SplashCubit _splashBloc = Injector.getIt.get<SplashCubit>();

  @override
  void initState() {
    _splashBloc.initial();

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
    return BlocListener<SplashCubit, SplashState>(
      bloc: _splashBloc,
      listener: (context, state) {
        if (state is MainState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteList.mainScreen,
            (route) => false,
          );
        } else if (state is LoginState) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteList.loginScreen, (route) => false);
        }
      },
      child: Material(
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
                  'Everyone likes money, right?',
                  style: ThemeText.caption
                      .copyWith(color: AppColor.secondaryColor),
                ),
                SizedBox(
                  height: LayoutConstants.paddingVertical58,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
