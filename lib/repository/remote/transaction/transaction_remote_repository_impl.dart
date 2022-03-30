import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/repository/remote/transaction/transaction_remote_repository.dart';

class TransactionRemoteRepositoryImpl extends TransactionRemoteRepository {
  TransactionRemoteRepositoryImpl() : super();

  @override
  Future<String> createTransaction(
      String uid, Map<String, dynamic> transactionData) async {
    try {
      final transaction = await FirebaseConfig.userDoc
          .collection(uid)
          .doc(DefaultEnvironment.profile)
          .collection(DefaultEnvironment.transaction)
          .add(transactionData);
      return transaction.id;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<bool> updateTransaction(
      String uid, TransactionModel transaction) async {
    try {
      await FirebaseConfig.userDoc
          .collection(uid)
          .doc(DefaultEnvironment.profile)
          .collection(DefaultEnvironment.transaction)
          .doc(transaction.id)
          .update(
            transaction.toJson(),
          );
      return true;
    } catch (e) {
      throw e;
    }
  }
}
