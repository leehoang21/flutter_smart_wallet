import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/utils/validator.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';

part 'register_state.dart';

class UserMock {
  final String uid = '1233144';
  final String phoneNumber = '0987654321';
}

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required UserMock user,
  }) : super(
          RegisterState(
            id: user.uid,
            userModel: UserModel(
              phoneNumber: user.phoneNumber,
            ),
          ),
        );

  void addUrl(String? url) {
    emit(
      state.copyWith(
        userModel: state.userModel.copyWith(
          avatar: url,
        ),
      ),
    );
  }

  Future<void> register({
    required String email,
    required String userName,
  }) async {
    if (!AppValidator().isNullEmpty(email)) {}
    emit(
      state.copyWith(
        userModel: state.userModel.copyWith(
          email: email,
          userName: userName,
        ),
      ),
    );
    if (userName.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'user name cannot be empty',
        ),
      );
      return;
    }
  }
}