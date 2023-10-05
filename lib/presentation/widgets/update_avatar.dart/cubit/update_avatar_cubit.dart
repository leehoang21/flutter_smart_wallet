import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';
part 'update_avatar_state.dart';

class UpdateAvatarCubit extends Cubit<UpdateAvatarState> {
  final String _id = 'Io7VtUfx1CM7yU7nLwwetTBneit1';
  final UserUseCase userUseCase;
  final PickImageUseCase pickImageUseCase;
  UpdateAvatarCubit({
    required this.userUseCase,
    required this.pickImageUseCase,
  }) : super(
          UpdateAvatarInitial(avatarPath: ''),
        ) {
    emit(
      UpdateAvatarInitial(
        avatarPath:
            '$_id/${DefaultEnvironment.profile}/${DefaultEnvironment.avatar}.png',
      ),
    );
  }

  Future<void> updateAvatar() async {
    final String _url;
    try {
      _url = await pickImageUseCase.downUrlImageStorage(
        imagePathStorage: state.avatarPath,
      );
      emit(UpdateAvatarSuccess(avatarPath: state.avatarPath, urlAvatar: _url));
    } catch (_) {
      emit(UpdateAvatarFailure(avatarPath: state.avatarPath));
    }
  }
}
