import 'package:flutter_smart_wallet/model/bank_info_model.dart';
import 'package:flutter_smart_wallet/repository/remote/vn_bank_repository.dart';

class VnBankUseCase {
  Future<List<BankInfoModel>> getBankInfoList() async {
    try {
      final response = await VnBankRepository().getVnBankList();
      if (response.code != 1000) {
        throw VnBankUseCaseError(response.message);
      }
      final data = response.data as Map<String, dynamic>;

      final banks = data['data'] as List;
      final results = <BankInfoModel>[];
      banks.forEach((bank) {
        results.add(BankInfoModel.fromJson(bank as Map<String, dynamic>));
      });
      results.sort((a, b) => a.code!.compareTo(b.code!));
      return results;
    } on Exception catch (e) {
      throw VnBankUseCaseError();
    }
  }
}

class VnBankUseCaseError implements Exception {
  final String message;

  VnBankUseCaseError([String? message])
      : this.message = message ?? "An error occured";
}
