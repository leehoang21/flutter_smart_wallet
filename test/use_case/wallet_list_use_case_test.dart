import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/repository/remote/wallet_repository.dart';
import 'package:flutter_smart_wallet/use_case/wallet_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'wallet_list_use_case_test.mocks.dart';

@GenerateMocks([WalletRepository])
void main() {
  group("WalletUseCase test: ", () {
    test(
        "Return a list of WalletModel when calling fetchWalletListFirebase() succeeded",
        () async {
      final mockWalletRepository = MockWalletRepository();
      final mockWalletUseCase = WalletUseCase(mockWalletRepository);
      when(mockWalletRepository.fetchWalletListFirebase()).thenAnswer(
        (realInvocation) async => mockData,
      );
      expect(
        await mockWalletUseCase.fetchWalletListFirebase(),
        isA<List<WalletModel>>(),
      );
    });

    test("Return true when calling addAndUpdateWalletListFirebase() succeeded",
        () async {
      final mockWalletRepository = MockWalletRepository();
      final mockWalletUseCase = WalletUseCase(mockWalletRepository);
      when(
        await mockWalletRepository.addAndUpdateWalletListFirebase(
            walletModel: WalletModel(
          walletType: 1,
          walletImage: '',
          walletName: 'test123',
          balance: 1234,
          createAt: DateTime.now().millisecondsSinceEpoch,
          lastUpdate: DateTime.now().millisecondsSinceEpoch,
        )),
      ).thenReturn(true);

      expect(
        await mockWalletUseCase.addAndUpdateWalletListFirebase(
            walletModel: WalletModel(
          walletType: 1,
          walletImage: '',
          walletName: 'test123',
          balance: 1234,
          createAt: DateTime.now().millisecondsSinceEpoch,
          lastUpdate: DateTime.now().millisecondsSinceEpoch,
        )),
        isA<bool>(),
      );
    });
  });
}

const mockData = {
  "data1": {
    'walletImage': "",
    'walletName': "test",
    'balance': 1234,
    'walletType': 1,
    'createAt': 1,
    'lastUpdate': 1,
  },
  "data2": {
    'walletImage': "",
    'walletName': "test",
    'balance': 1234,
    'walletType': 1,
    'createAt': 1,
    'lastUpdate': 1,
  },
};
