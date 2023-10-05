import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/use_case/authentication_use_case.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';

import '../../../../model/user_model.dart';
import '../../../../use_case/pick_image_use_case.dart';
import '../../../bloc/base_bloc/base_bloc.dart';

part 'account_state.dart';

class AccountCubit extends BaseBloc<AccountState> {
  final UserUseCase useCase;
  final AuthenticationUseCase authenticationUseCase;
  final PickImageUseCase pickImageUseCase;
  AccountCubit(this.useCase, this.authenticationUseCase, this.pickImageUseCase)
      : super(AccountState.initial());

  void getUser() async {
    emit(state.copyWith(status: AccountStateStatus.loading));
    UserModel _userModel = await useCase.getUser();
    if (!isNullEmpty(_userModel.avatar)) {
      final avatar = await pickImageUseCase.downUrlImageStorage(
          imagePathStorage: _userModel.avatar!);
      _userModel = _userModel.copyWith(avatar: avatar);
    }
    emit(state.copyWith(
      userModel: _userModel,
      status: AccountStateStatus.loaded,
    ));
  }

  @override
  void onConnected() {
    getUser();
    super.onConnected();
  }

  void signOut() async {
    await authenticationUseCase.signOut();
  }
}
