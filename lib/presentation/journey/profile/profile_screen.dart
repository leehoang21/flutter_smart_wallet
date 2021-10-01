import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/profile/profile_controller.dart';
import 'package:flutter_smart_wallet/presentation/journey/profile/profile_screen_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/profile/widgets/menu_item_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.paleGrey,
      appBar: AppBarWidget(
        leading: _buildLeadingAppBar(),
        action: AppBarButton(
          iconSource: IconConstants.notificationIcon,
          iconColor: AppColor.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingHorizontalApp),
        child: Column(
          children: [
            _buildProfileInfo(),
            SizedBox(
              height: LayoutConstants.paddingVerticalApp,
            ),
            MenuItem(
              leadingIconPath: IconConstants.categoriesIcon,
              title: 'categories'.tr,
              trailingIconPath: IconConstants.selectIcon,
              onTap: () {},
            ),
            SizedBox(
              height: LayoutConstants.paddingVertical10,
            ),
            MenuItem(
              leadingIconPath: IconConstants.languageIcon,
              title: 'language'.tr,
              trailingIconPath: IconConstants.selectIcon,
              onTap: () {},
            ),
            SizedBox(
              height: LayoutConstants.paddingVertical10,
            ),
            MenuItem(
              leadingIconPath: IconConstants.rateIcon,
              title: 'rate_me'.tr,
              trailingIconPath: IconConstants.selectIcon,
              onTap: () {},
            ),
            SizedBox(
              height: LayoutConstants.paddingVertical10,
            ),
            MenuItem(
              leadingIconPath: IconConstants.aboutIcon,
              title: 'about_me'.tr,
              trailingIconPath: IconConstants.selectIcon,
              onTap: () {},
            ),
            SizedBox(
              height: LayoutConstants.paddingVertical10,
            ),
            MenuItem(
              leadingIconPath: IconConstants.logoutIcon,
              title: 'logout'.tr,
              trailingIconPath: IconConstants.selectIcon,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Row _buildProfileInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.blue),
              borderRadius:
                  BorderRadius.circular(ProfileScreenConstants.largeIconSize)),
          child: Icon(
            Icons.person,
            size: ProfileScreenConstants.largeIconSize,
          ),
        ),
        SizedBox(
          width: LayoutConstants.paddingHorizontalApp,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'David Tèo',
                style: ThemeText.style18Bold,
              ),
              Text(
                'david.teo@gmail.com'.tr,
                style: ThemeText.style14Medium
                    .copyWith(color: AppColor.secondaryColor),
              ),
              Text(
                '0353458000ss'.tr,
                style: ThemeText.style14Medium
                    .copyWith(color: AppColor.secondaryColor),
              ),
            ],
          ),
        )
      ],
    );
  }

  Padding _buildLeadingAppBar() {
    return Padding(
      padding: EdgeInsets.only(left: LayoutConstants.paddingHorizontalApp),
      child: Text(
        'my_page'.tr,
        style: ThemeText.style18Bold,
      ),
    );
  }
}
