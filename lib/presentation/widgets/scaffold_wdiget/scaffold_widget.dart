import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';

class ScaffoldWidget extends StatelessWidget {
  final AppBarWidget? appbar;
  final Widget body;
  final Color backgroundColor;
  final Widget? bottomNavigationBar;

  const ScaffoldWidget({
    Key? key,
    required this.body,
    this.appbar,
    this.backgroundColor = Colors.white,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
                  horizontal: LayoutConstants.paddingHorizontalApp)
              .copyWith(bottom: LayoutConstants.paddingVerticalApp),
          child: body,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
