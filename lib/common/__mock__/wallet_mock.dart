import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';

List<WalletModel> walletList = [
  WalletModel(
      walletImage: "Cash in hand",
      balance: 10000,
      walletType: 1,
      createAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdate: DateTime.now().millisecondsSinceEpoch),
  WalletModel(
      walletImage: "TPBank",
      balance: 1222000,
      walletType: 2,
      createAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdate: DateTime.now().millisecondsSinceEpoch),
  WalletModel(
      walletImage: "Cash in hand",
      balance: 10000,
      walletType: 1,
      createAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdate: DateTime.now().millisecondsSinceEpoch),
];
