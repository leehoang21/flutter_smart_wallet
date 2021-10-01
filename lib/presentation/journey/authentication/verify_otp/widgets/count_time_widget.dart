import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/extensions/num_extension.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

import '../verify_otp_constatns.dart';

class CountTimeWidget extends StatefulWidget {
  final Function() onResend;

  const CountTimeWidget({Key? key, required this.onResend}) : super(key: key);

  @override
  _CountTimeWidgetState createState() => _CountTimeWidgetState();
}

class _CountTimeWidgetState extends State<CountTimeWidget> {
  Timer? _timer;
  int _start = 300;

  void _startCount() {
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => setState(() {
              if (_start < 1) {
                _timer!.cancel();
              } else {
                _start -= 1;
              }
            }));
  }

  @override
  void initState() {
    _startCount();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              VerifyOtpConstants.resend,
              style: ThemeText.caption.copyWith(
                  fontWeight: FontWeight.bold, color: AppColor.hintColor),
            ),
            Text(
              ' ${(_start ~/ 60).toStandardized}'
              ':'
              '${(_start % 60).toStandardized}',
              style: ThemeText.caption.copyWith(
                  fontWeight: FontWeight.bold, color: AppColor.hintColor),
            )
          ],
        ),
        InkWell(
          onTap: _start == 0 ? _resendOtp : null,
          child: Container(
            alignment: Alignment.center,
            child: RichText(
                text: TextSpan(
                    text: VerifyOtpConstants.didntReceiveTheCode,
                    style: ThemeText.caption.copyWith(color: AppColor.hintColor),
                    children: [
                  TextSpan(
                      text: VerifyOtpConstants.resend,
                      style: ThemeText.caption,)
                ])),
          ),
        ),
      ],
    );
  }
  void _resendOtp(){
    widget.onResend();
    _start = 300;
    _startCount();
  }
}
