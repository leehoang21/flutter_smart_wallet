import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:flutter_svg/svg.dart';

class MenuItem extends StatelessWidget {
  final String leadingIconPath;
  final String title;
  final String trailingIconPath;
  final Function() onTap;

  const MenuItem({
    Key? key,
    required this.leadingIconPath,
    required this.title,
    required this.trailingIconPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(LayoutConstants.borderSmall),
          boxShadow: [
            BoxShadow(
              color: AppColor.secondaryColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: SvgPicture.asset(leadingIconPath),
          title: Text(
            title,
            style: ThemeText.style14Medium,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: LayoutConstants.iconMediumSize,
            color: AppColor.black,
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: LayoutConstants.paddingHorizontalSmall),
        ),
      ),
    );
  }
}
