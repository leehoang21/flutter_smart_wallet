import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarButton extends StatelessWidget {
  final Widget? child;

  final String? iconSource;
  final Color? iconColor;
  final Function()? onTap;
  final double? width;
  final double? height;

  const AppBarButton({
    Key? key,
    this.child,
    this.iconSource,
    this.onTap,
    this.width,
    this.height,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppbarConstants.buttonSize,
      width: AppbarConstants.buttonSize,
      child: InkWell(
        onTap: onTap,
        child: child ??
            Center(
              child: SvgPicture.asset(
                iconSource!,
                color: iconColor ?? Colors.white,
                width: width ?? AppbarConstants.buttonIconSize,
                height: height ?? AppbarConstants.buttonIconSize,
              ),
            ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final Widget? leading;
  final Widget? action;
  final String? title;
  final Widget? centerWidget;
  final TextStyle? titleStyle;
  final Color? color;

  const AppBarWidget({
    Key? key,
    this.leading,
    this.title,
    this.action,
    this.centerWidget,
    this.titleStyle,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _top = MediaQuery.of(context).padding.top;
    return Container(
      color: color,
      height: AppbarConstants.buttonSize,
      margin: EdgeInsets.only(top: _top),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          leading ??
              SizedBox(
                width: AppbarConstants.buttonSize,
                height: AppbarConstants.buttonSize,
              ),
          centerWidget ??
              Text(
                title ?? '',
                style: titleStyle ??
                    ThemeText.subtitle1.copyWith(
                        fontWeight: FontWeight.bold, color: AppColor.white),
                textAlign: TextAlign.left,
              ),
          action != null
              ? action!
              : SizedBox(
                  width: AppbarConstants.buttonSize,
                  height: AppbarConstants.buttonSize,
                ),
        ],
      ),
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => AppbarConstants.appbarSize;
}
