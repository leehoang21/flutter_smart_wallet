import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Compress {
  static Future<Uint8List> compressWithFile(File file, int quality) async {
    final String filePath = file.absolute.path;
    final Uint8List? result = await FlutterImageCompress.compressWithFile(
      filePath,
      quality: quality,
    );
    if (result != null) {
      return result;
    } else {
      throw Exception('compression failed');
    }
  }

  static Future<File?> compressAndGetFile(File file, int quality) async {
    final String filePath = file.absolute.path;

    final int lastIndex = filePath.lastIndexOf(
      RegExp(r'.jp'),
    );
    final String splitted = filePath.substring(0, lastIndex);
    final String targetPath = '${splitted}_out${filePath.substring(lastIndex)}';

    final XFile? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: quality,
    );
    if (result != null) {
      return File(result.path);
    } else {
      throw Exception('compression failed');
    }
  }

  static Future<Uint8List> compressWithList(
      Uint8List imageToUpload, int quality) async {
    imageToUpload = await FlutterImageCompress.compressWithList(
      imageToUpload,
      quality: quality,
    );
    return imageToUpload;
  }
}
