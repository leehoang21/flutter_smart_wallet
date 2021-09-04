import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/controller/verify_otp_controller.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/verify_otp_constatns.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/widgets/count_time_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/icon_button_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends GetView<VerifyOtpController> {
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          top: VerifyOtpConstants.paddingTop,
          right: LayoutConstants.paddingHorizontalApp,
          left: LayoutConstants.paddingHorizontalApp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              VerifyOtpConstants.verifyAccount,
              style: ThemeText.headline4.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: VerifyOtpConstants.sizedBoxHeight38,
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  VerifyOtpConstants.verifyContent,
                  style: ThemeText.caption.copyWith(color: AppColor.hintColor),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: VerifyOtpConstants.sizedBoxHeight25,
            ),
            PinCodeTextField(
                controller: _otpController,
                appContext: context,
                length: VerifyOtpConstants.otpLength,
                keyboardType: TextInputType.number,
                showCursor: false,
                textStyle: ThemeText.headline6.copyWith(
                    fontWeight: FontWeight.bold, color: AppColor.hintColor),
                pinTheme: PinTheme(
                    activeColor: AppColor.hintColor,
                    inactiveColor: AppColor.iron,
                    disabledColor: AppColor.iron,
                    activeFillColor: AppColor.hintColor,
                    selectedColor: AppColor.hintColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: PinCodeFieldShape.box),
                onChanged: _onChangeOtp),
            SizedBox(
              height: VerifyOtpConstants.sizedBoxHeight25,
            ),
            Container(alignment: Alignment.center, child: CountTimeWidget()),
            Container(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      text: VerifyOtpConstants.didntReceiveTheCode,
                      style:
                          ThemeText.caption.copyWith(color: AppColor.hintColor),
                      children: [
                    TextSpan(
                        text: VerifyOtpConstants.resend,
                        style: ThemeText.caption)
                  ])),
            ),
            SizedBox(
              height: VerifyOtpConstants.sizedBoxHeight28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  VerifyOtpConstants.confirm,
                  style: ThemeText.headline6.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: VerifyOtpConstants.confirmFontSize,
                  ),
                ),
                IconButtonWidget(
                    onPressed: _confirm, iconSource: IconConstants.nextIcon)
              ],
            ),
          ],
        ),
      )),
    );
  }

  void _onChangeOtp(String value) {}

  void _confirm() {}
}
