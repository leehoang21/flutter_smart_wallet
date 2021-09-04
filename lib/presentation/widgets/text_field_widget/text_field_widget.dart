import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/common/extensions/size_extension.dart';

class TextFieldWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initValue;
  final Color? color;
  final double? height;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function(String)? validate;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatter;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final bool? obscureText;

  const TextFieldWidget(
      {Key? key,
      this.labelText,
      this.hintText,
      this.initValue,
      this.color,
      this.height,
      this.textStyle,
      this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      this.focusNode,
      this.onChanged,
      this.validate,
      this.onSaved,
      this.onEditingComplete,
      this.autovalidateMode,
      this.inputFormatter,
      this.textAlign,
      this.textCapitalization,
      this.keyboardType,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color ?? AppColor.hintColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      alignment: Alignment.center,
      height: height ?? 36.h,
      child: Center(
        child: TextFormField(
          initialValue: initValue,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          textAlign: textAlign ?? TextAlign.start,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          obscureText: obscureText ?? false,
          style: textStyle,
          onSaved: onSaved,
          autovalidateMode: autovalidateMode,
          inputFormatters: inputFormatter,
          keyboardType: keyboardType,
          scrollPadding: EdgeInsets.symmetric(
            vertical: 9.h
          ),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: textStyle,
            hintText: hintText,
            hintStyle: textStyle,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.hintColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.hintColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.hintColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.hintColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.hintColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.hintColor),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
      ),
    );
  }
}
