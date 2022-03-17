import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/pick_image/pick_image_screen_constant.dart';

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
        fontSize: PickImageScreenConstant.textSize,
      ),
    );
  }
}
