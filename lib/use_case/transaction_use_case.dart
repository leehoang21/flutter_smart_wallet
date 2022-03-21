import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/repository/remote/transaction_remote_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TransactionUseCase {
  final TransactionRemoteRepository _remoteRepository;

  TransactionUseCase(this._remoteRepository);

  Future<void> addTransaction(String uid, TransactionModel transaction) =>
      _remoteRepository.addTransaction(uid, transaction);

  Future<void> updateTransaction(String uid, TransactionModel transaction) =>
      _remoteRepository.updateTransaction(uid, transaction);
}
