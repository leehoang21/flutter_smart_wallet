// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_smart_wallet/test/use_case/pick_image_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart'
    as _i6;
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart'
    as _i3;
import 'package:flutter_smart_wallet/repository/remote/user/user_remote_repository.dart'
    as _i2;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserRemoteRepository_0 extends _i1.SmartFake
    implements _i2.UserRemoteRepository {
  _FakeUserRemoteRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UpDownStorageRemoteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpDownStorageRemoteRepository extends _i1.Mock
    implements _i3.UpDownStorageRemoteRepository {
  MockUpDownStorageRemoteRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserRemoteRepository get userRemoteRepository => (super.noSuchMethod(
        Invocation.getter(#userRemoteRepository),
        returnValue: _FakeUserRemoteRepository_0(
          this,
          Invocation.getter(#userRemoteRepository),
        ),
      ) as _i2.UserRemoteRepository);

  @override
  _i4.Future<bool> putUnit8List({
    required _i5.Uint8List? data,
    required String? pathStorage,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putUnit8List,
          [],
          {
            #data: data,
            #pathStorage: pathStorage,
          },
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<String> downloadUrl({required String? pathStorage}) =>
      (super.noSuchMethod(
        Invocation.method(
          #downloadUrl,
          [],
          {#pathStorage: pathStorage},
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);

  @override
  _i4.Future<bool> hasconnection() => (super.noSuchMethod(
        Invocation.method(
          #hasconnection,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [PickImageLocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPickImageLocalRepository extends _i1.Mock
    implements _i6.PickImageLocalRepository {
  MockPickImageLocalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.Uint8List?> pickImageFromGallery() => (super.noSuchMethod(
        Invocation.method(
          #pickImageFromGallery,
          [],
        ),
        returnValue: _i4.Future<_i5.Uint8List?>.value(),
      ) as _i4.Future<_i5.Uint8List?>);

  @override
  _i4.Future<_i5.Uint8List?> captureImage() => (super.noSuchMethod(
        Invocation.method(
          #captureImage,
          [],
        ),
        returnValue: _i4.Future<_i5.Uint8List?>.value(),
      ) as _i4.Future<_i5.Uint8List?>);

  @override
  _i4.Future<_i5.Uint8List?> pickImage({required _i7.ImageSource? source}) =>
      (super.noSuchMethod(
        Invocation.method(
          #pickImage,
          [],
          {#source: source},
        ),
        returnValue: _i4.Future<_i5.Uint8List?>.value(),
      ) as _i4.Future<_i5.Uint8List?>);

  @override
  _i4.Future<List<_i5.Uint8List>> multiImage() => (super.noSuchMethod(
        Invocation.method(
          #multiImage,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Uint8List>>.value(<_i5.Uint8List>[]),
      ) as _i4.Future<List<_i5.Uint8List>>);
}
