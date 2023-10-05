import 'dart:developer';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';

import '../../use_case/user_use_case.dart';

abstract class WalletRepository {
  final FirebaseConfig firebaseConfig;
  final UserUseCase userRemoteRepository;

  WalletRepository(this.firebaseConfig, this.userRemoteRepository);

  Future<Map> fetchWalletListFirebase();

  Future<bool> addAndUpdateWalletListFirebase(
      {required WalletModel walletModel});
}

class WalletRepositoryImpl extends WalletRepository {
  WalletRepositoryImpl(
      FirebaseConfig firebaseConfig, UserUseCase userRemoteRepository)
      : super(
          firebaseConfig,
          userRemoteRepository,
        );

  Future<Map> fetchWalletListFirebase() async {
    final response = await FirebaseConfig.userDoc
        .collection(await userRemoteRepository.getUid())
        .doc(DefaultEnvironment.profile)
        .collection(DefaultEnvironment.walletList)
        .get();
    if (isNullEmpty(response.docs)) {
      log(response.docs.toString());
      return {};
    } else {
      Map data = Map();
      for (var x in response.docs) {
        log(x.data().toString());
        data.addAll({x.id: x.data()});
      }

      return data;
    }
  }

  Future<bool> addAndUpdateWalletListFirebase(
      {required WalletModel walletModel}) async {
    try {
      final result = await FirebaseConfig.userDoc
          .collection(await userRemoteRepository.getUid())
          .doc(DefaultEnvironment.profile)
          .collection(DefaultEnvironment.walletList)
          .doc(walletModel.id.toString())
          .get();
      if (isNullEmpty(result.data())) {
        await FirebaseConfig.userDoc
            .collection(await userRemoteRepository.getUid())
            .doc(DefaultEnvironment.profile)
            .collection(DefaultEnvironment.walletList)
            .add(walletModel.toJson());
      } else {
        await FirebaseConfig.userDoc
            .collection(await userRemoteRepository.getUid())
            .doc(DefaultEnvironment.profile)
            .collection(DefaultEnvironment.walletList)
            .doc(walletModel.id.toString())
            .update(walletModel.toJson());
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
