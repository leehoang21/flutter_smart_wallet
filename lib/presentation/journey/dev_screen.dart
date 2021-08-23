import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/enums/snackbar_enum.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:flutter_smart_wallet/presentation/widgets/snackbar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:get/get.dart';

class DevScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Text('Develop', style: ThemeText.body1,),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingHorizontalApp,
        ),
        children: [
          ElevatedButton(onPressed: () {
            Get.find<AppController>().startLoading();
          }, child: Text('Loader', style: ThemeText.button,)),
          ElevatedButton(onPressed: () {
            Get.showSnackbar(CommonSnackbar(title: 'Test', style: SnackbarEnum.success));
          }, child: Text('Snackbar', style: ThemeText.button,)),
        ],
      ),
    );
  }

}