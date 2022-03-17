part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final UserInfomationModel userInfomationModel;
  final String id;
  final String? errorMessage;
  const RegisterState({
    this.errorMessage,
    required this.userInfomationModel,
    required this.id,
  });

  RegisterState copyWith({
    String? errorMessage,
    UserInfomationModel? userInfomationModel,
    String? id,
  }) {
    return RegisterState(
      errorMessage: errorMessage ?? this.errorMessage,
      userInfomationModel: userInfomationModel ?? this.userInfomationModel,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [id, userInfomationModel, errorMessage];
}
