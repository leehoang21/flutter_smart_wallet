import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/enums/loader_enum.dart';
import 'package:flutter_smart_wallet/presentation/controller/app_controller.dart';
import 'package:flutter_smart_wallet/presentation/widgets/loader_widget.dart';
import 'package:get/get.dart';

class RootScreen extends GetView<AppController> {
  final Widget child;

  RootScreen(this.child);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(LayoutConstants.widthDefault, LayoutConstants.heightDefault),
      builder: () {
        return Obx(() {
          return GestureDetector(
            onTap: () {
              // unFocus text field
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: Stack(
              children: [
                child,
                controller.loaderState.value == LoaderEnum.start ? LoaderWidget() : SizedBox.shrink(),
              ],
            ),
          );
        });
      },
    );
  }
}
