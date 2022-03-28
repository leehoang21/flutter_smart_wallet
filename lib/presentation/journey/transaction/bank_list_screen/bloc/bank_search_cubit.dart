import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/model/bank_info_model.dart';
import 'package:flutter_smart_wallet/use_case/vn_bank_use_case.dart';

class BankSearchState extends Equatable {
  final String keyword;
  const BankSearchState(this.keyword);

  @override
  List<Object?> get props => [];
}

class BankSearchNoResult extends BankSearchState {
  const BankSearchNoResult(String keyword) : super(keyword);
}

class BankSearchLoading extends BankSearchState {
  const BankSearchLoading(String keyword) : super(keyword);
}

class BankSearchLoaded extends BankSearchState {
  final List<BankInfoModel> bankList;

  const BankSearchLoaded(String keyword, this.bankList) : super(keyword);

  @override
  List<Object?> get props => bankList;
}

class BankSearchError extends BankSearchState {
  final String error;

  const BankSearchError(String keyword, this.error) : super(keyword);

  @override
  List<Object?> get props => [error];
}

class BankSearchCubit extends Cubit<BankSearchState> {
  late List<BankInfoModel> _bankList;

  final VnBankUseCase _vnBankUseCase;

  BankSearchCubit(this._vnBankUseCase) : super(BankSearchLoading("")) {
    _vnBankUseCase.getBankInfoList().then((value) {
      _bankList = value;
      emit(BankSearchLoaded("", _bankList));
    }).onError((VnBankUseCaseError error, stackTrace) {
      emit(BankSearchError("", error.message));
    });
  }

  void search(String key) {
    final convertedKey = key.toLowerCase();
    if (key.isEmpty) {
      emit(BankSearchLoaded(key, _bankList));
    } else {
      final result = _bankList.where((bank) {
        return bank.name!.toLowerCase().contains(convertedKey) ||
            bank.shortName!.toLowerCase().contains(convertedKey) ||
            bank.code!.toLowerCase().contains(convertedKey);
      }).toList();
      if (result.isEmpty) {
        emit(BankSearchNoResult(key));
      } else
        emit(BankSearchLoaded(key, result));
    }
  }
}
