part of 'update_avatar_cubit.dart';

abstract class UpdateAvatarState extends Equatable {
  final String? urlAvatar;
  final String avatarPath;
  const UpdateAvatarState({
    required this.avatarPath,
    required this.urlAvatar,
  });

  @override
  List<Object?> get props => [urlAvatar, avatarPath];
}

class UpdateAvatarInitial extends UpdateAvatarState {
  UpdateAvatarInitial({required String avatarPath})
      : super(
          avatarPath: avatarPath,
          urlAvatar: null,
        );
}

class UpdateAvatarSuccess extends UpdateAvatarState {
  UpdateAvatarSuccess({required String avatarPath, required String urlAvatar})
      : super(avatarPath: avatarPath, urlAvatar: urlAvatar);
}

class UpdateAvatarFailure extends UpdateAvatarState {
  UpdateAvatarFailure({required String avatarPath})
      : super(avatarPath: avatarPath, urlAvatar: null);
}
