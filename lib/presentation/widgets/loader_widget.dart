import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class LoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: AppColor.black.withOpacity(0.6),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}