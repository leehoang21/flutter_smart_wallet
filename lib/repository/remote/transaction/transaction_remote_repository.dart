import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';

abstract class TransactionRemoteRepository {
  TransactionRemoteRepository();

  Future<String> createTransaction(
      String uid, Map<String, dynamic> transactionData);
  Future<bool> updateTransaction(String uid, TransactionModel transaction);
  Future<QuerySnapshot<Map<String, dynamic>>> getTransaction(String uid);
}
