import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class AddPhotoButton extends StatelessWidget {
  final Function() addPhoto;

  const AddPhotoButton({Key? key, required this.addPhoto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: addPhoto,
      child: Container(
        width: AppDimens.height_100,
        height: AppDimens.height_100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.fieldColor,
          borderRadius: BorderRadius.all(
            Radius.circular(LayoutConstants.roundedRadius),
          ),
        ),
        child: Image.asset(ImageConstants.blackCamera),
      ),
    );
  }
}
