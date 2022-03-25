import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/register_screen_contant.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class BackgroundRegister extends StatelessWidget {
  final Widget child;
  const BackgroundRegister({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ebonyClay,
      appBar: AppBarWidget(
        centerWidget: Text(
          RegisterScreenContant.title,
          textAlign: TextAlign.center,
          style: ThemeText.style18Bold.copyWith(
            color: AppColor.white,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.space_16,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.white,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: AppDimens.space_30),
        padding: EdgeInsets.only(
          top: AppDimens.height_36,
          right: AppDimens.width_12,
          left: AppDimens.width_12,
        ),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimens.radius_20),
            topRight: Radius.circular(
              AppDimens.radius_20,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
