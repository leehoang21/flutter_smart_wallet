import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';

class TitleAction extends StatelessWidget {
  final String text;
  const TitleAction({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: AppDimens.space_24,
      ),
    );
  }
}
