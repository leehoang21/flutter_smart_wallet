import 'package:flutter_smart_wallet/common/configs/dio_config/base_response.dart';
import 'package:flutter_smart_wallet/model/bank_info_model.dart';
import 'package:flutter_smart_wallet/repository/remote/vn_bank_repository.dart';
import 'package:flutter_smart_wallet/use_case/vn_bank_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'vn_bank_use_case_test.mocks.dart';

@GenerateMocks([VnBankRepository])
void main() {
  group("VnBankUseCase test: ", () {
    test(
        "Return a list of BankInfoModel when calling getBankInfoList() succeeded",
        () async {
      final MockVnBankRepository mockVnBankRepository = MockVnBankRepository();
      final VnBankUseCase vnBankUseCase = VnBankUseCase(mockVnBankRepository);
      when(mockVnBankRepository.getVnBankList()).thenAnswer(
        (realInvocation) async => BaseResponse(
          code: 1000,
          message: "Success",
          data: mockApiData,
        ),
      );
      expect(
        await vnBankUseCase.getBankInfoList(),
        isA<List<BankInfoModel>>(),
      );
    });

    test("Throw a VnBankUseCaseError when calling getBankInfoList() failed",
        () async {
      final MockVnBankRepository mockVnBankRepository = MockVnBankRepository();
      final VnBankUseCase vnBankUseCase = VnBankUseCase(mockVnBankRepository);
      when(mockVnBankRepository.getVnBankList()).thenAnswer(
        (realInvocation) async => BaseResponse(
          code: -2,
          message: "Failed",
          data: mockApiData,
        ),
      );
      expect(
        () async => await vnBankUseCase.getBankInfoList(),
        throwsA(isA<VnBankUseCaseError>()),
      );
    });
  });
}

const mockApiData = {
  "code": "00",
  "desc": "Get Bank list successful! Total 52 banks",
  "data": [
    {
      "id": 17,
      "name": "Ngân hàng TMCP Công thương Việt Nam",
      "code": "ICB",
      "bin": "970415",
      "isTransfer": 1,
      "short_name": "VietinBank",
      "logo": "https://api.vietqr.io/img/ICB.3d4d6760.png",
      "support": 3
    },
    {
      "id": 43,
      "name": "Ngân hàng TMCP Ngoại Thương Việt Nam",
      "code": "VCB",
      "bin": "970436",
      "isTransfer": 1,
      "short_name": "Vietcombank",
      "logo": "https://api.vietqr.io/img/VCB.237d4924.png",
      "support": 3
    },
  ],
};
