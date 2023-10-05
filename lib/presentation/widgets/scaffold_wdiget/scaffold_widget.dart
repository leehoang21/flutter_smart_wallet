import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class ScaffoldWidget extends StatelessWidget {
  final AppBarWidget? appbar;
  final Widget body;
  final Color backgroundColor;
  final Widget? bottomNavigationBar;

  const ScaffoldWidget({
    Key? key,
    required this.body,
    this.appbar,
    this.backgroundColor = AppColor.ebonyClay,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: LayoutConstants.paddingTop24),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstants.paddingHorizontalApp)
                .copyWith(bottom: LayoutConstants.paddingVerticalApp),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: body,
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
