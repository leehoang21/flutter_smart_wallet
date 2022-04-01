import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';
part 'update_avatar_state.dart';

class UpdateAvatarCubit extends Cubit<UpdateAvatarState> {
  UserUseCase userUseCase;
  UpdateAvatarCubit({required this.userUseCase})
      : super(
          UpdateAvatarInitial(id: 'Io7VtUfx1CM7yU7nLwwetTBneit1'),
        );

  Future<void> updateAvatar(String url) async {
    try {
      bool _isSuccess = await userUseCase.updateAvatar(
        state.id,
        url,
      );
      if (_isSuccess) {
        emit(
          UpdateAvatarSuccess(id: state.id, urlAvatar: url),
        );
      } else {
        emit(UpdateAvatarFailure(id: state.id));
      }
    } catch (_) {
      emit(UpdateAvatarFailure(id: state.id));
    }
  }
}
