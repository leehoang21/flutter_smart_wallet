part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final Uint8List? avatar;
  final UserModel userModel;
  final String? errorMessage;
  const RegisterState({
    this.errorMessage,
    required this.userModel,
    this.avatar,
  });

  RegisterState copyWith({
    String? errorMessage,
    UserModel? userModel,
    Uint8List? avatar,
  }) {
    return RegisterState(
      errorMessage: errorMessage,
      userModel: userModel ?? this.userModel,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [userModel, errorMessage, avatar];
}
