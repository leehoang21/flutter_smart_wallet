import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit(this._pickImageUseCase) : super(PickImageInitial());
  final PickImageUseCase _pickImageUseCase;
  Future<void> pickImageFromGallery() async {
    try {
      Uint8List _image = await _pickImageUseCase.pickImageFromGallery();
      emit(ResultImage(_image));
    } on PickImageException catch (e) {
      emit(PickImageError(e.message));
    }
  }

  Future<void> captureImage() async {
    try {
      Uint8List _image = await _pickImageUseCase.captureImage();
      emit(ResultImage(_image));
    } on PickImageException catch (e) {
      PickImageError(e.message);
    }
  }

  void addImage(Uint8List image) {
    emit(ResultImage(image));
  }

  Future<void> upAndDownImage(
    String imagePathStorage,
  ) async {
    Uint8List? _image = state.image;
    if (_image != null) {
      try {
        String _url = await _pickImageUseCase.upAndDownImage(
          imageToUpload: _image,
        );
        emit(DownloadSuccess(url: _url));
      } on PickImageException catch (e) {
        emit(
          PickImageError(e.message),
        );
      }
    } else {
      emit(
        const PickImageError('No image selected'),
      );
    }
  }
}
