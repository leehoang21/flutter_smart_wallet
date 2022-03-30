import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart';

class PickImageUseCase {
  final UpDownStorageRemoteRepository remoteRepository;
  final PickImageLocalRepository localRepository;

  PickImageUseCase({
    required this.localRepository,
    required this.remoteRepository,
  });

  Future<Uint8List> pickImageFromGallery() async {
    Uint8List? imageToUpload = await localRepository.pickImageFromGallery();
    if (imageToUpload != null) {
      return imageToUpload;
    } else {
      throw PickImageException('no_image_selected');
    }
  }

  Future<Uint8List> captureImage() async {
    Uint8List? imageToUpload = await localRepository.captureImage();
    if (imageToUpload != null) {
      return imageToUpload;
    } else {
      throw PickImageException('no_image_selected');
    }
  }

  Future<List<Uint8List>> multiImagePicker() async {
    final images = await localRepository.multiImage();
    if (images.isNotEmpty) {
      return images;
    } else {
      throw PickImageException('no_image_selected');
    }
  }

  Future<String> upAndDownImage({
    required Uint8List imageToUpload,
    required String imagePathStorage,
  }) async {
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
        throw PickImageException('error_to_upload');
      }
    } else {
      throw PickImageException('no_internet');
    }
  }
}

class PickImageException extends Equatable implements Exception {
  final String message;

  PickImageException(this.message);

  @override
  List<Object?> get props => [message];
}
