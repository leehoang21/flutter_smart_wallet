import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpDownStorageRemoteRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<bool> putUnit8List({
    required Uint8List data,
    required String pathStorage,
  }) async {
    final Reference firebaseStorageRef = _firebaseStorage.ref(
      pathStorage,
    );

    TaskSnapshot _taskSnapshot = await firebaseStorageRef.putData(data);
    if (_taskSnapshot.state == TaskState.success) {
      return true;
    }
    return false;
  }

  Future<bool> putFile({
    required File data,
    required String pathStorage,
  }) async {
    final Reference firebaseStorageRef = _firebaseStorage.ref(
      pathStorage,
    );
    TaskSnapshot _taskSnapshot = await firebaseStorageRef.putFile(data);
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
