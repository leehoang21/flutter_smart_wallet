import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/repository/remote/transaction/transaction_remote_repository.dart';

class TransactionUseCase {
  final TransactionRemoteRepository _remoteRepository;

  TransactionUseCase(this._remoteRepository);

  Future<String> addTransaction(String uid, TransactionModel transaction) =>
      _remoteRepository.createTransaction(uid, transaction.toJson());

  Future<bool> updateTransaction(String uid, TransactionModel transaction) =>
      _remoteRepository.updateTransaction(uid, transaction);
}
