import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/repository/local/pick_image_local_repository.dart';
import 'package:todo_list/repository/remote/up_and_down_storage_remote_repository.dart';
import 'package:todo_list/use_case/pick_image_use_case.dart';

import 'pick_image_use_case_test.mocks.dart';

class MockTaskSnapshot extends Mock implements TaskSnapshot {}

@GenerateMocks([
  ImagePicker,
  FirebaseStorage,
  UpDownStorageRemoteRepository,
  PickImageLocalRepository,
])
void main() async {
  group(
    'pick image use case test',
    () {
      final MockPickImageLocalRepository mockLocalRepository =
          MockPickImageLocalRepository();
      final MockUpDownStorageRemoteRepository mockRemoteRepository =
          MockUpDownStorageRemoteRepository();
      final PickImageUseCase pickImageUseCase = PickImageUseCase(
        imagePathStorage: '1234',
        localRepository: mockLocalRepository,
        remoteRepository: mockRemoteRepository,
      );
      test(
        'pickImageFromGallery return Uint8List',
        () async {
          when(
            mockLocalRepository.pickImageFromGallery(),
          ).thenAnswer(
            (realInvocation) async => Uint8List.fromList(
              [1, 2, 3],
            ),
          );
          expect(
            await pickImageUseCase.pickImageFromGallery(),
            isA<Uint8List>(),
          );
        },
      );

      test(
        'pickImageFromGallery return throw PickImageException',
        () async {
          when(
            mockLocalRepository.pickImageFromGallery(),
          ).thenAnswer(
            (realInvocation) async => null,
          );
          expect(
            () async => await pickImageUseCase.pickImageFromGallery(),
            throwsA(
              isA<PickImageException>(),
            ),
          );
        },
      );

      test('captureImage return Uint8List', () async {
        when(
          mockLocalRepository.captureImage(),
        ).thenAnswer(
          (realInvocation) async => Uint8List.fromList(
            [1, 2, 3],
          ),
        );
        expect(
          await pickImageUseCase.captureImage(),
          isA<Uint8List>(),
        );
      });

      test(
        'captureImage return throw PickImageException',
        () async {
          when(
            mockLocalRepository.captureImage(),
          ).thenAnswer((realInvocation) async => null);
          expect(
            () async => await pickImageUseCase.captureImage(),
            throwsA(
              isA<PickImageException>(),
            ),
          );
        },
      );
    },
  );
}
