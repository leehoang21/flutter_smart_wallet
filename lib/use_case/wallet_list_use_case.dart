import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/repository/remote/wallet_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WalletUseCase {
  final WalletRepository walletRepository;

  WalletUseCase(this.walletRepository);

  Future<List<WalletModel>> fetchWalletListFirebase(String userId) async {
    List<WalletModel> walletList = [];
    try {
      final result = await walletRepository.fetchWalletListFirebase(userId);
      if (result != null) {
        result.forEach((key, value) {
          walletList.add(WalletModel.fromJson(value));
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return walletList;
  }

  Future<bool> addAndUpdateWalletListFirebase(
      String userId, WalletModel walletModel) async {
    try {
      final result = await walletRepository.addAndUpdateWalletListFirebase(
          userId, {"${walletModel.createAt}": walletModel.toJson()});
      return result;
    } catch (e) {
      return false;
    }
  }
}
