import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/dio_config/base_response.dart';
import 'package:flutter_smart_wallet/common/configs/dio_config/dio_api_client.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';


abstract class WalletRepository{
  final FirebaseConfig firebaseConfig;


  WalletRepository(this.firebaseConfig);

  Future<Map> fetchWalletListFirebase(String userId);

  Future<bool> addAndUpdateWalletListFirebase(
      String userId, Map<String,Object?> data);
}


class WalletRepositoryImpl extends WalletRepository{
  WalletRepositoryImpl(FirebaseConfig firebaseConfig) : super(firebaseConfig);


  Future<Map> fetchWalletListFirebase(String userId) async {
    final response = await firebaseConfig.userDoc
        .collection('customer')
        .doc('profile')
        .collection('wallet').get();
    if (response.docs == null) {
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
      String userId, Map<String,Object?> data) async {
    try {
      final result = await FirebaseFirestore.instance
          .doc(DefaultEnvironment.smartWallet)
          .collection(DefaultEnvironment.environment)
          .doc('customer')
      .collection('profile')
          .doc('wallet').get();
      if (result.data() == null) {
        await FirebaseFirestore.instance
            .collection(DefaultEnvironment.smartWallet)
            .doc(DefaultEnvironment.environment)
            .collection('customer')
            .doc('wallet').set(data);
      } else {
        await FirebaseFirestore.instance
            .collection(DefaultEnvironment.smartWallet)
            .doc(DefaultEnvironment.environment)
            .collection('customer')
            .doc('wallet').update(data);
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}