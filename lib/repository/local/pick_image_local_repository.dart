import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_smart_wallet/common/utils/compress.dart';
import 'package:image_picker/image_picker.dart';

class PickImageLocalRepository {
  ImagePicker _imagePicker = ImagePicker();

  Future<Uint8List?> pickImageFromGallery() async {
    return pickImage(source: ImageSource.gallery);
  }

  Future<Uint8List?> captureImage() async {
    return pickImage(source: ImageSource.camera);
  }

  Future<Uint8List?> pickImage({required ImageSource source}) async {
    XFile? pickedFile = await _imagePicker.pickImage(
      source: source,
    );

    return Compress.compressWithFile(
      File(pickedFile!.path),
      100,
    );
  }

  Future<List<Uint8List>> multiImage() async {
    final List<XFile>? files = await _imagePicker.pickMultiImage();
    final List<Uint8List> images = [];
    for (final file in files ?? []) {
      final image = await Compress.compressWithFile(file, 100);
      images.add(image);
    }
    return images;
  }
}
