import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.backgroundColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(text: 'Me', style: ThemeText.headline3.copyWith(fontFamily: 'QS'), children: [
                TextSpan(text: 'tie', style: ThemeText.headline3.copyWith(color: AppColor.blue, fontFamily: 'QS'))
              ]),
            ),
            SizedBox(
              height: LayoutConstants.paddingVertical8,
            ),
            Text(
              'Everyone like money, right?',
              style: ThemeText.caption.copyWith(color: AppColor.blue),
            ),
          ],
        ),
      ),
    );
  }
}
