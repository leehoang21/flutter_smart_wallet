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
  OtpWidget({Key? key}) : super(key: key);

  final TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          VerifyOtpConstants.verifyAccount,
          style: ThemeText.style18Bold,
          textAlign: TextAlign.left,
        ),
        Text(
          VerifyOtpConstants.description,
          style: ThemeText.caption
              .copyWith(fontWeight: FontWeight.w500, color: AppColor.grey),
        ),
        SizedBox(
          height: VerifyOtpConstants.distanceTextToFieldInput,
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
              vertical: VerifyOtpConstants.distanceTextToFieldInput),
          child: ButtonRichTextWidget(),
        ),
        TextButtonWidget(
          onPressed: () {
            context.read<VerifyCubit>().verifyOtp(_pinCodeController.text);
          },
          title: VerifyOtpConstants.confirm,
        ),
      ],
    );
  }
}
