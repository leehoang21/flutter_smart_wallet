// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/repository/remote/transaction/transaction_remote_repository.dart';

import '../repository/remote/wallet_repository.dart';

class TransactionUseCase {
  final TransactionRemoteRepository _remoteRepository;
  final WalletRepository _walletRepository;

  TransactionUseCase(this._remoteRepository, this._walletRepository);

  Future<String> addTransaction(
      String uid, TransactionModel transaction) async {
    TransactionModel _model = await _changeWallet(transaction);
    return _remoteRepository.createTransaction(uid, _model.toJson());
  }

  Future<TransactionModel> _changeWallet(TransactionModel transaction) async {
    TransactionModel _model = transaction;
    if (_model.category.type == 'REVENUE') {
      _model = _model.copyWith(
        wallet: _model.wallet.copyWith(
          balance: (_model.wallet.balance ?? 0) + transaction.amount,
          lastUpdate: DateTime.now().millisecond,
        ),
      );
    } else {
      _model = _model.copyWith(
        wallet: _model.wallet.copyWith(
          balance: (_model.wallet.balance ?? 0) - transaction.amount,
          lastUpdate: DateTime.now().millisecond,
        ),
      );
    }
    await _walletRepository.addAndUpdateWalletListFirebase(
        walletModel: _model.wallet);
    return _model;
  }

  Future<bool> updateTransaction(
      String uid, TransactionModel transaction) async {
    TransactionModel _model = await _changeWallet(transaction);
    return _remoteRepository.updateTransaction(uid, _model);
  }

  Future<List<TransactionModel>> getTransaction(String uid) async {
    final transaction = await _remoteRepository.getTransaction(uid);
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> result =
        transaction.docs;

    final data = result.map(
      (e) {
        logger(e.data().toString());
        final data = e.data() as Map<String, dynamic>;
        return TransactionModel.fromJson(data, e.id);
      },
    ).toList();
    return data;
  }
}
