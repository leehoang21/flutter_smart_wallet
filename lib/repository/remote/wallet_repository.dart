import 'dart:developer';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';


abstract class WalletRepository{
  final FirebaseConfig firebaseConfig;


  WalletRepository(this.firebaseConfig);

  Future<Map> fetchWalletListFirebase(String userId);

  Future<bool> addAndUpdateWalletListFirebase(
      {required String userId,required WalletModel walletModel});
}


class WalletRepositoryImpl extends WalletRepository{
  WalletRepositoryImpl(FirebaseConfig firebaseConfig) : super(firebaseConfig);


  Future<Map> fetchWalletListFirebase(String userId) async {
    final response = await FirebaseConfig.userDoc
        .collection(DefaultEnvironment.customer)
        .doc(DefaultEnvironment.profile)
        .collection(DefaultEnvironment.walletList).get();
    if (isNullEmpty(response.docs)) {
      log(response.docs.toString());
      return {};
    } else {
      Map data = Map();
      for(var x in response.docs)
        {
          log(x.data().toString());
          data.addAll({x.id:x.data()});
        }

      return data;
    }
  }

  Future<bool> addAndUpdateWalletListFirebase(
  {required String userId,required WalletModel walletModel}) async {
    try {
      final result = await FirebaseConfig.userDoc
          .collection(DefaultEnvironment.customer)
          .doc(DefaultEnvironment.profile)
          .collection(DefaultEnvironment.walletList).doc(walletModel.id.toString()).get();
      if (isNullEmpty(result.data())) {
        await FirebaseConfig.userDoc
            .collection(DefaultEnvironment.customer)
            .doc(DefaultEnvironment.profile)
            .collection(DefaultEnvironment.walletList).add(walletModel.toJson());
      } else {
        await FirebaseConfig.userDoc
            .collection(DefaultEnvironment.customer)
            .doc(DefaultEnvironment.profile)
            .collection(DefaultEnvironment.walletList)
            .doc(walletModel.id.toString()).update(walletModel.toJson());
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}