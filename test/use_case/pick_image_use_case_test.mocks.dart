// Mocks generated by Mockito 5.1.0 from annotations
// in tet/test/pick_image_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:io' as _i9;
import 'dart:typed_data' as _i8;

import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i4;
import 'package:image_picker/image_picker.dart' as _i5;
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_list/repository/local/pick_image_local_repository.dart'
    as _i10;
import 'package:todo_list/repository/remote/up_and_down_storage_remote_repository.dart'
    as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeLostData_0 extends _i1.Fake implements _i2.LostData {}

class _FakeLostDataResponse_1 extends _i1.Fake implements _i2.LostDataResponse {
}

class _FakeFirebaseApp_2 extends _i1.Fake implements _i3.FirebaseApp {}

class _FakeDuration_3 extends _i1.Fake implements Duration {}

class _FakeReference_4 extends _i1.Fake implements _i4.Reference {}

class _FakeTaskSnapshot_5 extends _i1.Fake implements _i4.TaskSnapshot {}

class _FakeImagePicker_6 extends _i1.Fake implements _i5.ImagePicker {}

/// A class which mocks [ImagePicker].
///
/// See the documentation for Mockito's code generation for more information.
class MockImagePicker extends _i1.Mock implements _i5.ImagePicker {
  MockImagePicker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.PickedFile?> getImage(
          {_i2.ImageSource? source,
          double? maxWidth,
          double? maxHeight,
          int? imageQuality,
          _i2.CameraDevice? preferredCameraDevice = _i2.CameraDevice.rear}) =>
      (super.noSuchMethod(
              Invocation.method(#getImage, [], {
                #source: source,
                #maxWidth: maxWidth,
                #maxHeight: maxHeight,
                #imageQuality: imageQuality,
                #preferredCameraDevice: preferredCameraDevice
              }),
              returnValue: Future<_i2.PickedFile?>.value())
          as _i6.Future<_i2.PickedFile?>);
  @override
  _i6.Future<List<_i2.PickedFile>?> getMultiImage(
          {double? maxWidth, double? maxHeight, int? imageQuality}) =>
      (super.noSuchMethod(
              Invocation.method(#getMultiImage, [], {
                #maxWidth: maxWidth,
                #maxHeight: maxHeight,
                #imageQuality: imageQuality
              }),
              returnValue: Future<List<_i2.PickedFile>?>.value())
          as _i6.Future<List<_i2.PickedFile>?>);
  @override
  _i6.Future<_i2.PickedFile?> getVideo(
          {_i2.ImageSource? source,
          _i2.CameraDevice? preferredCameraDevice = _i2.CameraDevice.rear,
          Duration? maxDuration}) =>
      (super.noSuchMethod(
              Invocation.method(#getVideo, [], {
                #source: source,
                #preferredCameraDevice: preferredCameraDevice,
                #maxDuration: maxDuration
              }),
              returnValue: Future<_i2.PickedFile?>.value())
          as _i6.Future<_i2.PickedFile?>);
  @override
  _i6.Future<_i2.LostData> getLostData() =>
      (super.noSuchMethod(Invocation.method(#getLostData, []),
              returnValue: Future<_i2.LostData>.value(_FakeLostData_0()))
          as _i6.Future<_i2.LostData>);
  @override
  _i6.Future<_i2.XFile?> pickImage(
          {_i2.ImageSource? source,
          double? maxWidth,
          double? maxHeight,
          int? imageQuality,
          _i2.CameraDevice? preferredCameraDevice = _i2.CameraDevice.rear}) =>
      (super.noSuchMethod(
          Invocation.method(#pickImage, [], {
            #source: source,
            #maxWidth: maxWidth,
            #maxHeight: maxHeight,
            #imageQuality: imageQuality,
            #preferredCameraDevice: preferredCameraDevice
          }),
          returnValue: Future<_i2.XFile?>.value()) as _i6.Future<_i2.XFile?>);
  @override
  _i6.Future<List<_i2.XFile>?> pickMultiImage(
          {double? maxWidth, double? maxHeight, int? imageQuality}) =>
      (super.noSuchMethod(
              Invocation.method(#pickMultiImage, [], {
                #maxWidth: maxWidth,
                #maxHeight: maxHeight,
                #imageQuality: imageQuality
              }),
              returnValue: Future<List<_i2.XFile>?>.value())
          as _i6.Future<List<_i2.XFile>?>);
  @override
  _i6.Future<_i2.XFile?> pickVideo(
          {_i2.ImageSource? source,
          _i2.CameraDevice? preferredCameraDevice = _i2.CameraDevice.rear,
          Duration? maxDuration}) =>
      (super.noSuchMethod(
          Invocation.method(#pickVideo, [], {
            #source: source,
            #preferredCameraDevice: preferredCameraDevice,
            #maxDuration: maxDuration
          }),
          returnValue: Future<_i2.XFile?>.value()) as _i6.Future<_i2.XFile?>);
  @override
  _i6.Future<_i2.LostDataResponse> retrieveLostData() =>
      (super.noSuchMethod(Invocation.method(#retrieveLostData, []),
              returnValue:
                  Future<_i2.LostDataResponse>.value(_FakeLostDataResponse_1()))
          as _i6.Future<_i2.LostDataResponse>);
}

/// A class which mocks [FirebaseStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseStorage extends _i1.Mock implements _i4.FirebaseStorage {
  MockFirebaseStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.FirebaseApp get app => (super.noSuchMethod(Invocation.getter(#app),
      returnValue: _FakeFirebaseApp_2()) as _i3.FirebaseApp);
  @override
  set app(_i3.FirebaseApp? _app) =>
      super.noSuchMethod(Invocation.setter(#app, _app),
          returnValueForMissingStub: null);
  @override
  String get bucket =>
      (super.noSuchMethod(Invocation.getter(#bucket), returnValue: '')
          as String);
  @override
  set bucket(String? _bucket) =>
      super.noSuchMethod(Invocation.setter(#bucket, _bucket),
          returnValueForMissingStub: null);
  @override
  Duration get maxOperationRetryTime =>
      (super.noSuchMethod(Invocation.getter(#maxOperationRetryTime),
          returnValue: _FakeDuration_3()) as Duration);
  @override
  Duration get maxUploadRetryTime =>
      (super.noSuchMethod(Invocation.getter(#maxUploadRetryTime),
          returnValue: _FakeDuration_3()) as Duration);
  @override
  Duration get maxDownloadRetryTime =>
      (super.noSuchMethod(Invocation.getter(#maxDownloadRetryTime),
          returnValue: _FakeDuration_3()) as Duration);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i4.Reference ref([String? path]) =>
      (super.noSuchMethod(Invocation.method(#ref, [path]),
          returnValue: _FakeReference_4()) as _i4.Reference);
  @override
  _i4.Reference refFromURL(String? url) =>
      (super.noSuchMethod(Invocation.method(#refFromURL, [url]),
          returnValue: _FakeReference_4()) as _i4.Reference);
  @override
  void setMaxOperationRetryTime(Duration? time) =>
      super.noSuchMethod(Invocation.method(#setMaxOperationRetryTime, [time]),
          returnValueForMissingStub: null);
  @override
  void setMaxUploadRetryTime(Duration? time) =>
      super.noSuchMethod(Invocation.method(#setMaxUploadRetryTime, [time]),
          returnValueForMissingStub: null);
  @override
  void setMaxDownloadRetryTime(Duration? time) =>
      super.noSuchMethod(Invocation.method(#setMaxDownloadRetryTime, [time]),
          returnValueForMissingStub: null);
  @override
  _i6.Future<void> useEmulator({String? host, int? port}) =>
      (super.noSuchMethod(
          Invocation.method(#useEmulator, [], {#host: host, #port: port}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> useStorageEmulator(String? host, int? port) =>
      (super.noSuchMethod(Invocation.method(#useStorageEmulator, [host, port]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [UpDownStorageRemoteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpDownStorageRemoteRepository extends _i1.Mock
    implements _i7.UpDownStorageRemoteRepository {
  MockUpDownStorageRemoteRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.TaskSnapshot> putUnit8List(
          {_i8.Uint8List? data, String? pathStorage}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #putUnit8List, [], {#data: data, #pathStorage: pathStorage}),
              returnValue:
                  Future<_i4.TaskSnapshot>.value(_FakeTaskSnapshot_5()))
          as _i6.Future<_i4.TaskSnapshot>);
  @override
  _i6.Future<_i4.TaskSnapshot> putFile({_i9.File? data, String? pathStorage}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #putFile, [], {#data: data, #pathStorage: pathStorage}),
              returnValue:
                  Future<_i4.TaskSnapshot>.value(_FakeTaskSnapshot_5()))
          as _i6.Future<_i4.TaskSnapshot>);
  @override
  _i6.Future<String> downloadUrlTaskSnapshot(
          {_i4.TaskSnapshot? storageSnapshot}) =>
      (super.noSuchMethod(
          Invocation.method(#downloadUrlTaskSnapshot, [],
              {#storageSnapshot: storageSnapshot}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> downloadUrl({String? pathStorage}) => (super.noSuchMethod(
      Invocation.method(#downloadUrl, [], {#pathStorage: pathStorage}),
      returnValue: Future<String>.value('')) as _i6.Future<String>);
}

/// A class which mocks [PickImageLocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPickImageLocalRepository extends _i1.Mock
    implements _i10.PickImageLocalRepository {
  MockPickImageLocalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.ImagePicker get imagePicker =>
      (super.noSuchMethod(Invocation.getter(#imagePicker),
          returnValue: _FakeImagePicker_6()) as _i5.ImagePicker);
  @override
  set imagePicker(_i5.ImagePicker? _imagePicker) =>
      super.noSuchMethod(Invocation.setter(#imagePicker, _imagePicker),
          returnValueForMissingStub: null);
  @override
  _i6.Future<_i8.Uint8List?> pickImageFromGallery() =>
      (super.noSuchMethod(Invocation.method(#pickImageFromGallery, []),
              returnValue: Future<_i8.Uint8List?>.value())
          as _i6.Future<_i8.Uint8List?>);
  @override
  _i6.Future<_i8.Uint8List?> captureImage() =>
      (super.noSuchMethod(Invocation.method(#captureImage, []),
              returnValue: Future<_i8.Uint8List?>.value())
          as _i6.Future<_i8.Uint8List?>);
  @override
  _i6.Future<_i8.Uint8List?> pickImage({_i2.ImageSource? source}) =>
      (super.noSuchMethod(Invocation.method(#pickImage, [], {#source: source}),
              returnValue: Future<_i8.Uint8List?>.value())
          as _i6.Future<_i8.Uint8List?>);
}
