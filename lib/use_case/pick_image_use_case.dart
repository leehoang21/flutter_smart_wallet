import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_smart_wallet/common/utils/compress.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart';

class PickImageUseCase {
  final UpDownStorageRemoteRepository _remoteRepository;

  final PickImageLocalRepository _localRepository;
  final String imagePathStorage;

  PickImageUseCase({
    required this.imagePathStorage,
    UpDownStorageRemoteRepository? remoteRepository,
    PickImageLocalRepository? localRepository,
  })  : _remoteRepository = remoteRepository ?? UpDownStorageRemoteRepository(),
        _localRepository = localRepository ?? PickImageLocalRepository();

  Future<Uint8List> pickImageFromGallery() async {
    Uint8List? imageToUpload = await _localRepository.pickImageFromGallery();
    if (imageToUpload != null) {
      return imageToUpload;
    } else {
      throw PickImageException('No image selected');
    }
  }

  Future<Uint8List> captureImage() async {
    Uint8List? imageToUpload = await _localRepository.captureImage();
    if (imageToUpload != null) {
      return imageToUpload;
    } else {
      throw PickImageException(
        'No image selected',
      );
    }
  }

  Future<String> upAndDownImage({
    required Uint8List imageToUpload,
  }) async {
    imageToUpload = await Compress.compressWithList(imageToUpload, 90);

    bool _hasConnection = await InternetChecker.hasConnection();
    if (_hasConnection) {
      TaskSnapshot _task = await _remoteRepository.putUnit8List(
        data: imageToUpload,
        pathStorage: imagePathStorage,
      );

      bool isSuccess = _task.state == TaskState.success;
      if (isSuccess) {
        return await _remoteRepository.downloadUrlTaskSnapshot(
          storageSnapshot: _task,
        );
      } else {
        throw PickImageException(
          'Error to upload',
        );
      }
    } else {
      throw PickImageException(
        'No internet connection',
      );
    }
  }
}

class PickImageException implements Exception {
  final String message;

  PickImageException([
    this.message = 'An unknown exception occurred',
  ]);
}
