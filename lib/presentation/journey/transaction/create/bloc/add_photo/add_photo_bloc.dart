import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/add_photo/add_photo_state.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';

class AddPhotoBloc extends Cubit<AddPhotoState> {
  final PickImageUseCase _pickImageUseCase;

  AddPhotoBloc(this._pickImageUseCase) : super(AddPhotoState.initial());

  Future<void> openGallery() async {
    final images = await _pickImageUseCase.multiImagePicker();
    emit(
      state.copyWith(
        photos: state.photos..addAll(images),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> openCamera() async {
    final image = await _pickImageUseCase.captureImage();
    emit(
      state.copyWith(
        photos: state.photos..add(image),
        lastUpdate: DateTime.now(),
      ),
    );
  }
}
