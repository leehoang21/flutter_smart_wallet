import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';

abstract class TransactionRemoteRepository {
  final FirebaseConfig firebaseConfig;

  TransactionRemoteRepository(this.firebaseConfig);

  Future<String> createTransaction(
      String uid, Map<String, dynamic> transactionData);
  Future<bool> updateTransaction(String uid, TransactionModel transaction);
}
