import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class AddPhotoButton extends StatelessWidget {
  final Function() addPhoto;

  const AddPhotoButton({Key? key, required this.addPhoto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: CreateTransactionConstants.sizedBoxHeight100,
      height: CreateTransactionConstants.sizedBoxHeight100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.fieldColor,
        borderRadius: BorderRadius.all(
          Radius.circular(LayoutConstants.roundedRadius),
        ),
      ),
      child: Image.asset(ImageConstants.blackCamera),
    );
  }
}
