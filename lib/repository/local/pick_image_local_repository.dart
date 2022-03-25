import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_smart_wallet/common/utils/compress.dart';
import 'package:image_picker/image_picker.dart';

class PickImageLocalRepository {
  ImagePicker imagePicker = ImagePicker();

  Future<Uint8List?> pickImageFromGallery() async {
    return pickImage(source: ImageSource.gallery);
  }

  Future<Uint8List?> captureImage() async {
    return pickImage(source: ImageSource.camera);
  }

  Future<Uint8List?> pickImage({required ImageSource source}) async {
    XFile? pickedFile = await imagePicker.pickImage(
      source: source,
    );

    return Compress.compressWithFile(
      File(pickedFile!.path),
      100,
    );
  }
}
