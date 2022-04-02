import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/utils/validator.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final String _id = 'Io7VtUfx1CM7yU7nLwwetTBneit1';
  final PickImageUseCase pickImageUseCase;
  final UserUseCase useCase;
  RegisterCubit({
    required this.useCase,
    required this.pickImageUseCase,
  }) : super(
          RegisterState(
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
    String _phone = '+84123456789';
    return '0' +
        _phone.substring(3, 6) +
        ' ' +
        _phone.substring(6, 9) +
        ' ' +
        _phone.substring(9, 12);
  }

  void addAvatar(Uint8List image) {
    emit(
      state.copyWith(avatar: image),
    );
  }

  Future<void> register({
    required String email,
    required String userName,
  }) async {
    Uint8List? _avatar = state.avatar;
    final String _storagePath = '$_id/${DefaultEnvironment.avatar}.png';

    if (_avatar != null) {
      try {
        String _url = await pickImageUseCase.upAndDownImage(
          imageToUpload: _avatar,
          imagePathStorage: _storagePath,
        );
        emit(state.copyWith(
            userModel: state.userModel.copyWith(
          avatar: _url,
          email: email,
          userName: userName,
        )));
      } on PickImageException catch (e) {
        emit(
          state.copyWith(errorMessage: e.message),
        );
      } catch (e) {
        emit(
          state.copyWith(errorMessage: 'error_message'),
        );
      }
    } else {
      emit(
        state.copyWith(errorMessage: 'no_image_selected'),
      );
    }

    if (!AppValidator().isNullEmpty(email)) {
      if (!AppValidator.expEmail.hasMatch(email)) {
        emit(
          state.copyWith(
            errorMessage: 'invalid_email',
          ),
        );
        return;
      }
    }

    if (userName.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'user_empty',
        ),
      );
      return;
    }

    try {
      await useCase.setUserFirestore(
        _id,
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
