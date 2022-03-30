import 'dart:typed_data';

import 'package:equatable/equatable.dart';

enum AddPhotoStatus { initial, loading, success, failed }

class AddPhotoState extends Equatable {
  final AddPhotoStatus status;
  final List<Uint8List> photos;
  final DateTime lastUpdate;

  AddPhotoState({
    required this.status,
    required this.photos,
    required this.lastUpdate,
  });

  factory AddPhotoState.initial() => AddPhotoState(
        status: AddPhotoStatus.initial,
        photos: [],
        lastUpdate: DateTime.now(),
      );

      

  @override
  List<Object?> get props => [status, photos, lastUpdate];

  AddPhotoState copyWith({
    AddPhotoStatus? status,
    List<Uint8List>? photos,
    DateTime? lastUpdate,
  }) {
    return AddPhotoState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
