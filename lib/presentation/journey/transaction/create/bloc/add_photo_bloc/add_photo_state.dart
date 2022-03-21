import 'package:equatable/equatable.dart';

enum AddPhotoStatus {
  initial,
  loading,
  success,
  failed,
}

class AddPhotoState extends Equatable {
  final AddPhotoStatus status;

  AddPhotoState({
    required this.status,
  });

  factory AddPhotoState.initial() => AddPhotoState(
        status: AddPhotoStatus.initial,
      );
  @override
  List<Object?> get props => [status];

  AddPhotoState copyWith({
    AddPhotoStatus? status,
  }) {
    return AddPhotoState(
      status: status ?? this.status,
    );
  }
}
