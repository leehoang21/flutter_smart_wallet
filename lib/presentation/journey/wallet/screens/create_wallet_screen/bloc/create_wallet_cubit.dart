import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/model/wallet_type_model.dart';

class CreateWalletState extends Equatable {
  WalletTypeModel walletTypeModel;
  int balance;
  String walletName;


  CreateWalletState({required this.walletTypeModel,required this.balance,required this.walletName});

  @override
  List<Object?> get props => [this.walletTypeModel, this.balance, this.walletName];
}

class CreateWalletCubit extends Cubit<CreateWalletState>
{
  CreateWalletCubit() : super(CreateWalletState(walletTypeModel:walletTypeList.first, balance: 0, walletName: ''));

 
}


