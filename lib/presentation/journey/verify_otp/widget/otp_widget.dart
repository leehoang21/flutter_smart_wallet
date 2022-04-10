import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/cubit/verify_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/verify_otp_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/widget/button_rich_text_widget.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/widget/pin_code_field_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    Key? key,
    required TextEditingController pinCodeController,
  })  : _pinCodeController = pinCodeController,
        super(key: key);

  final TextEditingController _pinCodeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          VerifyAccountConstants.verifyAccount,
          style: ThemeText.style18Bold,
          textAlign: TextAlign.left,
        ),
        Text(
          VerifyAccountConstants.description,
          style: ThemeText.caption
              .copyWith(fontWeight: FontWeight.w500, color: AppColor.grey),
        ),
        SizedBox(
          height: VerifyAccountConstants.distanceTextToFieldInput,
        ),
        PinCodeFieldWidget(
          controller: _pinCodeController,
        ),
        Align(
          child: Text(
            context.watch<VerifyCubit>().state.timeResend,
            style: ThemeText.style14Medium.copyWith(
                color: AppColor.taupeGray, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: VerifyAccountConstants.distanceTextToFieldInput),
          child: ButtonRichTextWidget(),
        ),
        TextButtonWidget(
          onPressed: () {
            context.read<VerifyCubit>().verifyOtp(_pinCodeController.text);
          },
          title: VerifyAccountConstants.confirm,
        ),
      ],
    );
  }
}
