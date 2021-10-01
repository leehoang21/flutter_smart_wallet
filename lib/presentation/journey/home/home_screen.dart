import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/controller/home_controller.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/widgets/bottom_tab.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/widgets/pages_view.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //   resizeToAvoidBottomPadding: false,
        body: _buildBodyWidget());
  }

  Widget _buildBodyWidget() {
    return GetBuilder<HomeController>(
      assignId: true,
      builder: (logic) {
        return Stack(
          children: [
            PagesViewHome(),
            Visibility(
              visible: MediaQuery.of(Get.context!).viewInsets.bottom == 0,
              child: Container(
                child: Align(
                    alignment: Alignment.bottomCenter, child: BottomTabHome()),
              ),
            ),
          ],
        );
      },
    );
  }
}
