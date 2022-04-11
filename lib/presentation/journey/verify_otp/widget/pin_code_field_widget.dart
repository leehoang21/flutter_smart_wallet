import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/verify_otp_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeFieldWidget extends StatelessWidget {
  const PinCodeFieldWidget({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      cursorColor: AppColor.taupeGray,
      appContext: context,
      length: 6,
      controller: controller,
      onChanged: (value) {},
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(6),
        fieldHeight: VerifyOtpConstants.widthFieldInput,
        fieldWidth: VerifyOtpConstants.widthFieldInput,
        borderWidth: 2,
        activeColor: AppColor.taupeGray,
        inactiveColor: AppColor.platinum,
        selectedColor: AppColor.taupeGray,
      ),
    );
  }
}
