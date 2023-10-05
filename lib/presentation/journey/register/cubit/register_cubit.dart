import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/common/utils/validator.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final PickImageUseCase pickImageUseCase;
  final UserUseCase useCase;
  RegisterCubit({
    required this.useCase,
    required this.pickImageUseCase,
  }) : super(
          RegisterState(
            userModel: UserModel(
              phoneNumber: '',
              uId: null,
            ),
          ),
        ) {
    _initState();
  }

  void _initState() async {
    Injector.getIt.get<LoadingBloc>().startLoading();
    final phone = await useCase.getPhoneNumber();
    emit(
      state.copyWith(
        userModel: UserModel(
          phoneNumber: _formatPhone(phone),
          uId: await useCase.getUid(),
        ),
      ),
    );
    Injector.getIt.get<LoadingBloc>().finishLoading();
  }

  String _formatPhone(String phone) {
    String _phone = phone;
    if (phone.startsWith('+84'))
      return '0' +
          _phone.substring(3, 6) +
          ' ' +
          _phone.substring(6, 9) +
          ' ' +
          _phone.substring(9, 12);
    else
      return _phone;
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
    final String _storagePath =
        '${DefaultEnvironment.profile}/${DefaultEnvironment.avatar}.png';
    emit(
      state.copyWith(errorMessage: null),
    );
    if (_avatar != null) {
      try {
        await pickImageUseCase.upImageStorage(
          imageToUpload: _avatar,
          imagePathStorage: _storagePath,
        );
        emit(
          state.copyWith(
            userModel: state.userModel.copyWith(
              avatar: _storagePath,
              email: email,
              userName: userName,
            ),
          ),
        );
      } on PickImageException catch (e) {
        emit(
          state.copyWith(errorMessage: e.message),
        );
      } catch (e) {
        emit(
          state.copyWith(errorMessage: 'error_message'),
        );
      }
    }

    if (!AppValidator().isNullEmpty(email)) {
      if (!AppValidator.expEmail.hasMatch(email)) {
        emit(
          state.copyWith(errorMessage: 'invalid_email'),
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
        state.userModel.copyWith(
          email: email,
          userName: userName,
          avatar: _avatar != null ? _storagePath : null,
        ),
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
