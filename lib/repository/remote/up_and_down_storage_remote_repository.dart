import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class UpDownStorageRemoteRepository {
  final FirebaseStorage firebaseStorage;

  UpDownStorageRemoteRepository({FirebaseStorage? firebaseStorage})
      : firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  Future<TaskSnapshot> putUnit8List({
    required Uint8List data,
    required String pathStorage,
  }) async {
    final Reference firebaseStorageRef = FirebaseStorage.instance.ref(
      pathStorage,
    );

    return await firebaseStorageRef.putData(data);
  }

  Future<TaskSnapshot> putFile({
    required File data,
    required String pathStorage,
  }) async {
    final Reference firebaseStorageRef = FirebaseStorage.instance.ref(
      pathStorage,
    );
    return await firebaseStorageRef.putFile(data);
  }

  Future<String> downloadUrlTaskSnapshot({
    required TaskSnapshot storageSnapshot,
  }) async {
    return await storageSnapshot.ref.getDownloadURL();
  }

  Future<String> downloadUrl({
    required String pathStorage,
  }) async {
    return await FirebaseStorage.instance
        .ref(
          pathStorage,
        )
        .getDownloadURL();
  }
}
