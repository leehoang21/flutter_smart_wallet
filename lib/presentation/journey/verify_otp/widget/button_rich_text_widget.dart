import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/cubit/verify_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/verify_otp_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class ButtonRichTextWidget extends StatelessWidget {
  const ButtonRichTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 36),
          children: <TextSpan>[
            TextSpan(
              text: VerifyAccountConstants.notReceivecode,
              style:
                  ThemeText.style14Medium.copyWith(color: AppColor.taupeGray),
            ),
            TextSpan(
              text: VerifyAccountConstants.resend,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (context.read<VerifyCubit>().timeOut()) {
                    context.read<VerifyCubit>().verifyPhonenumber();
                  }
                },
              style: ThemeText.style14Medium,
            )
          ],
        ),
      ),
    );
  }
}
