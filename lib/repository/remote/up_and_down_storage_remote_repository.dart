import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_smart_wallet/common/configs/firebase_config.dart';
import 'package:flutter_smart_wallet/common/utils/compress.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';

class UpDownStorageRemoteRepository {
  Future<bool> putUnit8List({
    required Uint8List data,
    required String pathStorage,
  }) async {
    final Reference _storageRef = FirebaseConfig.userStorage.child(pathStorage);

    data = await Compress.compressWithList(data, 90);

    TaskSnapshot _taskSnapshot = await _storageRef.putData(data);
    if (_taskSnapshot.state == TaskState.success) {
      return true;
    }
    return false;
  }

  Future<String> downloadUrl({
    required String pathStorage,
  }) async {
    return await FirebaseConfig.userStorage.child(pathStorage).getDownloadURL();
  }

  Future<bool> hasconnection() async {
    return await InternetChecker.hasConnection();
  }
}
