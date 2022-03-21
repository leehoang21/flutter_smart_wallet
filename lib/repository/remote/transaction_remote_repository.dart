import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class TransactionRemoteRepository {
  final firestore = FirebaseFirestore.instance
      .collection(DefaultEnvironment.smartWallet)
      .doc(DefaultEnvironment.environment);

  Future<void> addTransaction(String uid, TransactionModel transaction) async {
    await firestore
        .collection(uid)
        .doc(DefaultEnvironment.transaction)
        .collection(DefaultEnvironment.daily)
        .add(
          transaction.toJson(),
        );
  }

  Future<void> updateTransaction(
      String uid, TransactionModel transaction) async {
    await firestore
        .collection(uid)
        .doc(DefaultEnvironment.transaction)
        .collection(DefaultEnvironment.daily)
        .doc(transaction.id)
        .update(
          transaction.toJson(),
        );
  }
}
