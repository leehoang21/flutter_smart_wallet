part of 'update_avatar_cubit.dart';

abstract class UpdateAvatarState extends Equatable {
  final String? urlAvatar;
  final String id;
  const UpdateAvatarState({
    required this.id,
    required this.urlAvatar,
  });

  @override
  List<Object?> get props => [urlAvatar, id];
}

class UpdateAvatarInitial extends UpdateAvatarState {
  UpdateAvatarInitial({required String id})
      : super(
          id: id,
          urlAvatar: null,
        );
}

class UpdateAvatarSuccess extends UpdateAvatarState {
  UpdateAvatarSuccess({required String id, required String urlAvatar})
      : super(id: id, urlAvatar: urlAvatar);
}

class UpdateAvatarFailure extends UpdateAvatarState {
  UpdateAvatarFailure({required String id}) : super(id: id, urlAvatar: null);
}
