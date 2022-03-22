import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/model/bank_info_model.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/repository/remote/wallet_repository.dart';
import 'package:flutter_smart_wallet/use_case/vn_bank_usse_case.dart';
import 'package:flutter_smart_wallet/use_case/wallet_list_use_case.dart';


class WalletListState extends Equatable {
  const WalletListState();

  @override
  List<Object?> get props => [];
}

class WalletListNoResult extends WalletListState {}

class WalletListLoading extends WalletListState {}

class WalletListLoaded extends WalletListState {
  final List<WalletModel> walletList;

  const WalletListLoaded(this.walletList);

  @override
  List<Object?> get props => walletList;
}

class WalletListError extends WalletListState {
  final String error;

  const WalletListError(this.error);

  @override
  List<Object?> get props => [error];
}


class WalletListCubit extends Cubit<WalletListState> {
  final WalletUseCase walletUseCase;


  WalletListCubit(this.walletUseCase) : super(WalletListLoading()) {
    getWalletList();
  }

  Future<void> getWalletList() async{
    emit(WalletListLoading());
  try{
    final walletList =  await walletUseCase.fetchWalletListFirebase("");
    emit(WalletListLoaded(walletList));
  } catch(e)
    {
      emit(WalletListError(e.toString()));
    }

  }


}
