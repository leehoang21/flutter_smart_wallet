import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_smart_wallet/common/utils/compress.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';

class UpDownStorageRemoteRepository {
  final FirebaseStorage _firebaseStorage;
  UpDownStorageRemoteRepository(this._firebaseStorage);

  Future<bool> putUnit8List({
    required Uint8List data,
    required String pathStorage,
  }) async {
    final Reference firebaseStorageRef = _firebaseStorage.ref(
      pathStorage,
    );

    data = await Compress.compressWithList(data, 90);

    TaskSnapshot _taskSnapshot = await firebaseStorageRef.putData(data);
    if (_taskSnapshot.state == TaskState.success) {
      return true;
    }
    return false;
  }

  Future<String> downloadUrl({
    required String pathStorage,
  }) async {
    return await _firebaseStorage.ref(pathStorage).getDownloadURL();
  }

  Future<bool> hasconnection() async {
    return await InternetChecker.hasConnection();
  }
}
