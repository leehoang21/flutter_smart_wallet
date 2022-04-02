import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';
part 'update_avatar_state.dart';

class UpdateAvatarCubit extends Cubit<UpdateAvatarState> {
  UserUseCase userUseCase;
  UpdateAvatarCubit({required this.userUseCase})
      : super(
          UpdateAvatarInitial(
              avatarPath:
                  'Io7VtUfx1CM7yU7nLwwetTBneit1/${DefaultEnvironment.avatar}.png'),
        );

  Future<void> updateAvatar(String url) async {
    try {
      bool _isSuccess = await userUseCase.updateAvatar(
        state.avatarPath,
        url,
      );
      if (_isSuccess) {
        emit(
          UpdateAvatarSuccess(avatarPath: state.avatarPath, urlAvatar: url),
        );
      } else {
        emit(UpdateAvatarFailure(avatarPath: state.avatarPath));
      }
    } catch (_) {
      emit(UpdateAvatarFailure(avatarPath: state.avatarPath));
    }
  }
}
