import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/repository/remote/wallet_repository.dart';

class WalletUseCase {
  final WalletRepository walletRepository;

  WalletUseCase(this.walletRepository);

  Future<List<WalletModel>> fetchWalletListFirebase() async {
    List<WalletModel> walletList = [];
    try {
      final result = await walletRepository.fetchWalletListFirebase();
      if (result.isNotEmpty) {
        return result.entries
            .map((e) => WalletModel.fromJson(e.value, e.key))
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return walletList;
  }

  Future<bool> addAndUpdateWalletListFirebase(
      {required WalletModel walletModel}) async {
    try {
      final result = await walletRepository.addAndUpdateWalletListFirebase(
          walletModel: walletModel);
      return result;
    } catch (e) {
      return false;
    }
  }
}
