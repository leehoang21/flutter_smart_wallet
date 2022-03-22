import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/common/utils/validator.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:flutter_smart_wallet/use_case/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuth firebaseAuth;
  final RegisterUseCase registerUseCase;
  RegisterCubit({
    required this.firebaseAuth,
    required this.registerUseCase,
  }) : super(
          RegisterState(
            //id: firebaseAuth.currentUser!.uid,
            id: 'Io7VtUfx1CM7yU7nLwwetTBneit1',
            userModel: UserModel(phoneNumber: ''),
          ),
        ) {
    emit(
      state.copyWith(
        userModel: UserModel(
          phoneNumber: _formatPhone(),
        ),
      ),
    );
  }

  String _formatPhone() {
    String _phone = firebaseAuth.currentUser!.phoneNumber!;
    return '0' +
        _phone.substring(3, 6) +
        ' ' +
        _phone.substring(6, 9) +
        ' ' +
        _phone.substring(9, 12);
  }

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
    emit(
      state.copyWith(
        userModel: state.userModel.copyWith(
          email: email,
          userName: userName,
        ),
      ),
    );
    if (!AppValidator().isNullEmpty(email)) {
      if (AppValidator.expEmail.hasMatch(email)) {
        emit(
          state.copyWith(
            errorMessage: 'invalid email',
          ),
        );
        return;
      }
    }
    if (userName.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'user name cannot be empty',
        ),
      );
      return;
    }

    try {
      await registerUseCase.addUser(
        state.id,
        state.userModel,
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
        ),
      );
      return;
    }
  }
}
