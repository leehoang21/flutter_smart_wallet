import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/argument_constants.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/presentation/journey/authentication/verify_otp/verify_otp_constatns.dart';
import 'package:flutter_smart_wallet/presentation/journey/authentication/verify_otp/widgets/count_time_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/icon_button_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'controller/verify_otp_controller.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  final int resendToken;

  VerifyOtpScreen(
      {Key? key,
      required this.verificationId,
      required this.phoneNumber,
      required this.resendToken})
      : super(key: key);

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _otpController = TextEditingController();
  String? _verificationId;
  String? _phoneNumber;
  int? _resendToken;
  final resendValue = ValueNotifier(false);
  final _verifyOtpController = Get.find<VerifyOtpController>();

  @override
  void initState() {
    _verificationId = widget.verificationId;
    _phoneNumber = widget.phoneNumber;
    _resendToken = widget.resendToken;
    _verifyOtpController.nextScreen.listen((value) {
      if (value.isNotEmpty){
        if (value == RouteList.mainScreen){
          Get.offNamedUntil(RouteList.mainScreen, (route) => false);
        }
        if (value == RouteList.registerScreen){
          Get.offNamedUntil(RouteList.registerScreen, (route) => false,arguments: {
            ArgumentConstants.phoneNumber : _phoneNumber
          });
        }
      }
    });
    _verifyOtpController.verificationId.listen((value) {
      _verificationId = _verifyOtpController.verificationId.value;
      _resendToken = _verifyOtpController.resendToken.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
        leading: AppBarButton(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
            size: VerifyOtpConstants.sizedBoxHeight18,
          ),
        ),
      ),
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
            Container(alignment: Alignment.center, child: CountTimeWidget(
              onResend: _resendOtp,
            )),
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

  void _onChangeOtp(String value) {
    if (value.length == 6) {
      _verifyOtpController.verifyOtp(_verificationId!, value);
    }
  }

  void _confirm() {
    _verifyOtpController.verifyOtp(_verificationId!, _otpController.text);
  }
  void _resendOtp(){
    _verifyOtpController.resendOtp(_phoneNumber!, _resendToken!);
  }
}
