import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/utils/compress.dart';
import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PickImageUseCase {
  final UpDownStorageRemoteRepository remoteRepository;
  final Compress compress;
  final PickImageLocalRepository localRepository;
  final String imagePathStorage;

  PickImageUseCase({
    required this.imagePathStorage,
    required this.compress,
    required this.localRepository,
    required this.remoteRepository,
  });

  Future<Uint8List> pickImageFromGallery() async {
    Uint8List? imageToUpload = await localRepository.pickImageFromGallery();
    if (imageToUpload != null) {
      return imageToUpload;
    } else {
      throw PickImageException('No image selected');
    }
  }

  Future<Uint8List> captureImage() async {
    Uint8List? imageToUpload = await localRepository.captureImage();
    if (imageToUpload != null) {
      return imageToUpload;
    } else {
      throw PickImageException('No image selected');
    }
  }

  Future<String> upAndDownImage({
    required Uint8List imageToUpload,
  }) async {
    imageToUpload = await compress.compressWithList(imageToUpload, 90);

    bool hasConnection = await remoteRepository.hasconnection();

    if (hasConnection) {
      bool isSuccess = await remoteRepository.putUnit8List(
        data: imageToUpload,
        pathStorage: imagePathStorage,
      );

      if (isSuccess) {
        return remoteRepository.downloadUrl(
          pathStorage: imagePathStorage,
        );
      } else {
        throw PickImageException('Error to upload');
      }
    } else {
      throw PickImageException('No internet connection');
    }
  }
}

class PickImageException extends Equatable implements Exception {
  final String message;

  PickImageException([
    String? message,
  ]) : message = message ?? 'An unknown exception occurred';

  @override
  List<Object?> get props => [message];
}
