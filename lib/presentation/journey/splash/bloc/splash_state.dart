import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  SplashState({this.isUser});
  final bool? isUser;
  factory SplashState.initial() => SplashState(isUser: false);
  SplashState copyWith({bool? isUser}) =>
      SplashState(isUser: isUser ?? this.isUser);
  @override
  List<Object?> get props => [isUser];
}
