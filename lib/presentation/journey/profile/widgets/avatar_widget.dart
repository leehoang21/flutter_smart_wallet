import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(LayoutConstants.avatarSize),
          child: Container(
              height: LayoutConstants.avatarSize,
              width: LayoutConstants.avatarSize,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]
              ),
              child: Image.asset(ImageConstants.defaultAvatarImg)),
        ),
        // Container(
        //   height: LayoutConstants.smallIconBtnSize,
        //   width: LayoutConstants.smallIconBtnSize,
        //   margin: EdgeInsets.all(3),
        //   decoration: BoxDecoration(boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withOpacity(0.5),
        //       spreadRadius: 0,
        //       blurRadius: 5, // changes position of shadow
        //     ),
        //   ], shape: BoxShape.circle, color: AppColor.primaryColor),
        //   child: Icon(
        //     Icons.camera_alt_outlined,
        //     size: LayoutConstants.iconSize,
        //     color: AppColor.white,
        //   ),
        // )
      ],
    );
  }

}