import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/model/bank_info_model.dart';
import 'package:flutter_smart_wallet/use_case/vn_bank_usse_case.dart';

class BankSearchState extends Equatable {
  const BankSearchState();

  @override
  List<Object?> get props => [];
}

class BankSearchNoResult extends BankSearchState {}

class BankSearchLoading extends BankSearchState {}

class BankSearchLoaded extends BankSearchState {
  final List<BankInfoModel> bankList;

  const BankSearchLoaded(this.bankList);

  @override
  List<Object?> get props => bankList;
}

class BankSearchError extends BankSearchState {
  final String error;

  const BankSearchError(this.error);

  @override
  List<Object?> get props => [error];
}

class BankSearchCubit extends Cubit<BankSearchState> {
  late List<BankInfoModel> _bankList;

  final VnBankUseCase _vnBankUseCase;

  BankSearchCubit(this._vnBankUseCase) : super(BankSearchLoading()) {
    _vnBankUseCase.getBankInfoList().then((value) {
      _bankList = value;
      emit(BankSearchLoaded(_bankList));
    }).onError((VnBankUseCaseError error, stackTrace) {
      emit(BankSearchError(error.message));
    });
  }

  void search(String key) {
    final convertedKey = key.toLowerCase();
    if (key.isEmpty) {
      emit(BankSearchLoaded(_bankList));
    } else {
      final result = _bankList.where((bank) {
        return bank.name!.toLowerCase().contains(convertedKey) ||
            bank.shortName!.toLowerCase().contains(convertedKey) ||
            bank.code!.toLowerCase().contains(convertedKey);
      }).toList();
      if (result.isEmpty) {
        emit(BankSearchNoResult());
      } else
        emit(BankSearchLoaded(result));
    }
  }
}
