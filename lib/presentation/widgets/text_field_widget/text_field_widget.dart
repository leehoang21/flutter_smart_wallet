import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

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
  final Function()? onTap;
  final String? Function(String?)? validate;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatter;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? readOnly;
  final bool? enabled;

  const TextFieldWidget({
    Key? key,
    this.enabled,this.labelText,
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
    this.onTap,
    this.autovalidateMode,
    this.inputFormatter,
    this.textAlign,
    this.textCapitalization,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      initialValue: initValue,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      textAlign: textAlign ?? TextAlign.start,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      obscureText: obscureText ?? false,
      style: textStyle ??
          ThemeText.caption
              .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
      onSaved: onSaved,
      validator: validate,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatter,
      keyboardType: keyboardType,
      scrollPadding: EdgeInsets.symmetric(vertical: 9.h),
      cursorColor: AppColor.hintColor,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: TextFieldConstants.contentPaddingHorizontal,
          vertical: TextFieldConstants.contentPaddingVertical,
        ),
        labelText: labelText,
        labelStyle: textStyle ??
            ThemeText.caption
                .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
        hintText: hintText,
        hintStyle: textStyle ??
            ThemeText.caption
                .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: AppColor.fieldColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.borderSmall),
          ),
        ),
      ),
    );
  }
}
