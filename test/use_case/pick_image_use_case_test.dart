import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_wallet/common/utils/compress.dart';
import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'pick_image_use_case_test.mocks.dart';

@GenerateMocks([
  Compress,
  ImagePicker,
  FirebaseStorage,
  UpDownStorageRemoteRepository,
  PickImageLocalRepository,
])
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  group(
    'pick image use case test',
    () {
      final MockCompress mockCompress = MockCompress();
      final MockPickImageLocalRepository mockLocalRepository =
          MockPickImageLocalRepository();
      final MockUpDownStorageRemoteRepository mockRemoteRepository =
          MockUpDownStorageRemoteRepository();
      final PickImageUseCase pickImageUseCase = PickImageUseCase(
        compress: mockCompress,
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
        'pickImageFromGallery return throw PickImageException(No image selected)',
        () async {
          when(
            mockLocalRepository.pickImageFromGallery(),
          ).thenAnswer(
            (realInvocation) async => null,
          );
          expect(
            () async => await pickImageUseCase.pickImageFromGallery(),
            throwsA(
              PickImageException('No image selected'),
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
        'captureImage return throw PickImageException(No image selected)',
        () async {
          when(
            mockLocalRepository.captureImage(),
          ).thenAnswer((realInvocation) async => null);
          expect(
            () async => await pickImageUseCase.captureImage(),
            throwsA(
              PickImageException('No image selected'),
            ),
          );
        },
      );

      test('upAndDownImage return url', () async {
        when(
          mockCompress.compressWithList(
            Uint8List.fromList(
              [1, 2, 3],
            ),
            90,
          ),
        ).thenAnswer(
          (_) async => Uint8List.fromList(
            [1, 2, 3],
          ),
        );

        when(
          mockRemoteRepository.hasconnection(),
        ).thenAnswer(
          (realInvocation) async => true,
        );

        when(
          mockRemoteRepository.putUnit8List(
            data: Uint8List.fromList(
              [1, 2, 3],
            ),
            pathStorage: '1234',
          ),
        ).thenAnswer(
          (_) async => true,
        );

        when(
          mockRemoteRepository.downloadUrl(
            pathStorage: '1234',
          ),
        ).thenAnswer(
          (_) async => '1234',
        );

        expect(
          await pickImageUseCase.upAndDownImage(
            imageToUpload: Uint8List.fromList(
              [1, 2, 3],
            ),
          ),
          isA<String>(),
        );
      });

      test(
          'upAndDownImage return throw PickImageException(No internet connection)',
          () async {
        when(
          mockCompress.compressWithList(
            Uint8List.fromList(
              [1, 2, 3],
            ),
            90,
          ),
        ).thenAnswer(
          (_) async => Uint8List.fromList(
            [1, 2, 3],
          ),
        );

        when(
          mockRemoteRepository.hasconnection(),
        ).thenAnswer(
          (realInvocation) async => false,
        );

        expect(
          () async => await pickImageUseCase.upAndDownImage(
            imageToUpload: Uint8List.fromList(
              [1, 2, 3],
            ),
          ),
          throwsA(
            PickImageException('No internet connection'),
          ),
        );
      });

      test('upAndDownImage return throw PickImageException(Error to upload)',
          () async {
        when(
          mockCompress.compressWithList(
            Uint8List.fromList(
              [1, 2, 3],
            ),
            90,
          ),
        ).thenAnswer(
          (_) async => Uint8List.fromList(
            [1, 2, 3],
          ),
        );

        when(
          mockRemoteRepository.hasconnection(),
        ).thenAnswer(
          (realInvocation) async => true,
        );

        when(
          mockRemoteRepository.putUnit8List(
            data: Uint8List.fromList(
              [1, 2, 3],
            ),
            pathStorage: '1234',
          ),
        ).thenAnswer(
          (_) async => false,
        );

        expect(
          () async => await pickImageUseCase.upAndDownImage(
            imageToUpload: Uint8List.fromList(
              [1, 2, 3],
            ),
          ),
          throwsA(
            PickImageException('Error to upload'),
          ),
        );
      });
    },
  );
}
