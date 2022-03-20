part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final UserModel userModel;
  final String id;
  final String? errorMessage;
  const RegisterState({
    this.errorMessage,
    required this.userModel,
    required this.id,
  });

  RegisterState copyWith({
    String? errorMessage,
    UserModel? userModel,
    String? id,
  }) {
    return RegisterState(
      errorMessage: errorMessage ?? this.errorMessage,
      userModel: userModel ?? this.userModel,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [id, userModel, errorMessage];
}
