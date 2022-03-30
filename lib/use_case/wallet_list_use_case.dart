import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/repository/remote/wallet_repository.dart';

class WalletUseCase {
  final WalletRepository walletRepository;

  WalletUseCase(this.walletRepository);

  Future<List<WalletModel>> fetchWalletListFirebase(String userId) async {
    List<WalletModel> walletList = [];
    try {
      final result = await walletRepository.fetchWalletListFirebase(userId);
      if (result.isNotEmpty) {
        result.forEach((key, value) {
          walletList.add(WalletModel.fromJson({key:value}));
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return walletList;
  }

  Future<bool> addAndUpdateWalletListFirebase(
  {required  String userId,required WalletModel walletModel}) async {
    try {
      final result = await walletRepository.addAndUpdateWalletListFirebase(
          userId: userId,walletModel: walletModel );
      return result;
    } catch (e) {
      return false;
    }
  }
}
