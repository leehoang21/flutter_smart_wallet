import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/repository/remote/transaction/transaction_remote_repository.dart';
import 'package:flutter_smart_wallet/use_case/transaction_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transaction_use_case_test.mocks.dart';

@GenerateMocks([TransactionRemoteRepository])
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  group(
    'create transaction test',
        () {
      final TransactionRemoteRepository _transactionRemoteRepository =
      MockTransactionRemoteRepository();
      final TransactionUseCase _transactionUseCase =
      TransactionUseCase(_transactionRemoteRepository);
      test(
        'create success',
            () async {
          when(
            _transactionRemoteRepository.createTransaction(
              'uid',
              {
                "amount": 1000,
                "note": "hihi",
                "category": {
                  "name": "EATING",
                  "type": null,
                  "createAt": null,
                  "lastUpdate": null,
                  "subCategories": null
                },
                "spendTime": 1648234955218,
                "photo": null,
                "wallet": {
                  "walletImage": null,
                  "walletName": "Test Wallet",
                  "balance": null,
                  "walletType": null,
                  "createAt": null,
                  "lastUpdate": null
                },
                "createAt": 1648234955218,
                "lastUpdate": 1648234955218
              },
            ),
          ).thenAnswer((_) async => 'transaction id');
          expect(
              _transactionUseCase.addTransaction(
                  'uid',
                  TransactionModel(
                      amount: 1000,
                      category: CategoryModel(name: 'EATING'),
                      spendTime: 1648234955218,
                      wallet: WalletModel(walletName: 'Test Wallet'),
                      createAt: 1648234955218,
                      note: 'hihi',
                      lastUpdate: 1648234955218)),
              isA<Future<String>>());
        },
      );
    },
  );
}
