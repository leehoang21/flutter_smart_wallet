part of 'verify_cubit.dart';

abstract class VerifyState extends Equatable {
  VerifyState(this.timeResend);

  final String timeResend;

  @override
  List<Object> get props => [timeResend];
}

class VerifyInitial extends VerifyState {
  VerifyInitial() : super('0:05:00');
}

class VerifyLoading extends VerifyState {
  VerifyLoading(String timeResend) : super(timeResend);
}

class Verifyloaded extends VerifyState {
  Verifyloaded(String timeResend) : super(timeResend);
}

class VerifySuccess extends VerifyState {
  VerifySuccess(String timeResend) : super(timeResend);
}

class VerifyFailure extends VerifyState {
  VerifyFailure({required this.error, required String timeResend})
      : super(timeResend);
  final String error;
}
