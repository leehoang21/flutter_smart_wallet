import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/dio_config/base_response.dart';
import 'package:flutter_smart_wallet/common/configs/dio_config/dio_api_client.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:injectable/injectable.dart';

abstract class WalletRepository{
  final FirebaseConfig firebaseConfig;


  WalletRepository(this.firebaseConfig);

  Future<Map> fetchWalletListFirebase(String userId);

}

@Injectable(as: WalletRepository)
class WalletRepositoryImpl extends WalletRepository{
  WalletRepositoryImpl(FirebaseConfig firebaseConfig) : super(firebaseConfig);


  Future<Map> fetchWalletListFirebase(String userId) async {
    final response = await FirebaseFirestore.instance
        .collection(DefaultEnvironment.smartWallet)
        .doc(DefaultEnvironment.environment)
        .collection('customer')
        .doc('wallets').get();
    if (response.data() == null) {
      log("vvvvvvvvvvvvvvvvvvvv");
      return {};
    } else {
      Map data = response.data() as Map;
      log(data.toString());
      return data;
    }
  }
}