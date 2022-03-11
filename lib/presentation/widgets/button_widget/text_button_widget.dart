import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class TextButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? titleColor;
  final String title;
  final double? width;
  final double? height;

  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.buttonColor,
    this.titleColor,
    this.height,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(onPressed != null
            ? this.buttonColor ?? AppColor.black
            : AppColor.iron),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, LayoutConstants.buttonSize),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(width ?? MediaQuery.of(context).size.width,
              height ?? LayoutConstants.buttonSize),
        ),
      ),
      child: Text(
        title,
        style: ThemeText.caption.copyWith(
            fontWeight: FontWeight.bold, color: titleColor ?? AppColor.white),
      ),
    );
  }
}
