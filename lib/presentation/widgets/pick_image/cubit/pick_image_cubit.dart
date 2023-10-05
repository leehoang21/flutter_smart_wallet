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
    } catch (e) {
      emit(PickImageError('error_message'));
    }
  }

  Future<void> captureImage() async {
    try {
      Uint8List _image = await _pickImageUseCase.captureImage();
      emit(ResultImage(_image));
    } on PickImageException catch (e) {
      emit(PickImageError(e.message));
    } catch (e) {
      emit(PickImageError('error_message'));
    }
  }

  void addImage(Uint8List image) {
    emit(ResultImage(image));
  }

  Future<void> upImageStorage(
    String imagePathStorage,
  ) async {
    Uint8List? _image = state.image;
    if (_image != null) {
      try {
        final bool _isSuccess = await _pickImageUseCase.upImageStorage(
          imagePathStorage: imagePathStorage,
          imageToUpload: _image,
        );
        if (_isSuccess) {
          emit(DownloadSuccess());
        } else {
          emit(DownloadFailure());
        }
      } on PickImageException catch (e) {
        emit(
          PickImageError(e.message),
        );
      } catch (e) {
        emit(PickImageError('error_message'));
      }
    } else {
      emit(
        const PickImageError('no_image_selected'),
      );
    }
  }
}
