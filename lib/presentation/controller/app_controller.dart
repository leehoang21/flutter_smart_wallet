import 'dart:async';
import 'dart:developer';

import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/common/configs/hive_config/hive_config.dart';
import 'package:flutter_smart_wallet/common/constants/strings/string_constants.dart';
import 'package:flutter_smart_wallet/common/enums/loader_enum.dart';
import 'package:flutter_smart_wallet/common/enums/snackbar_enum.dart';
import 'package:flutter_smart_wallet/common/translation/translate.dart';
import 'package:flutter_smart_wallet/presentation/widgets/snackbar_widget/snackbar_widget.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  Rx<LoaderEnum> loaderState = LoaderEnum.finish.obs;
  int _defaultTimeOut = 10;
  late StreamSubscription _subscription;

  void startLoading() {
    loaderState.value = LoaderEnum.start;
    _subscription = Future.delayed(Duration(seconds: _defaultTimeOut)).asStream().listen((event) {
      timeout();
    });
  }

  void finishLoading() {
    loaderState.value = LoaderEnum.finish;
    _subscription.cancel();
  }

  void timeout() {
    if (loaderState.value == LoaderEnum.start) {
      loaderState.value = LoaderEnum.finish;
      Get.showSnackbar(CommonSnackBar(title: CommonTranslate.getString(StringConstants.msgErrorUnknown), type: SnackbarEnum.error));
    }
  }

  @override
  void onReady() {
    super.onReady();
    Get.find<FirebaseConfig>().init();
    Get.find<HiveConfig>().init();
  }
}
