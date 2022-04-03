import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'pick_image_use_case_test.mocks.dart';

@GenerateMocks([
  UpDownStorageRemoteRepository,
  PickImageLocalRepository,
])
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  group(
    'pick image use case test',
    () {
      final MockPickImageLocalRepository mockLocalRepository =
          MockPickImageLocalRepository();
      final MockUpDownStorageRemoteRepository mockRemoteRepository =
          MockUpDownStorageRemoteRepository();
      final PickImageUseCase pickImageUseCase = PickImageUseCase(
        localRepository: mockLocalRepository,
        remoteRepository: mockRemoteRepository,
      );
      test(
        'return Uint8List when calling pickImageFromGallery() succesed',
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

      test('return Uint8List when calling captureImage() succesed', () async {
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

      test('return true when calling putUnit8List()', () async {
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

        expect(
          await pickImageUseCase.upImageStorage(
            imagePathStorage: '1234',
            imageToUpload: Uint8List.fromList(
              [1, 2, 3],
            ),
          ),
          isA<bool>(),
        );
      });

      test('return url when calling downloadUrlt()', () async {
        when(
          mockRemoteRepository.hasconnection(),
        ).thenAnswer(
          (realInvocation) async => true,
        );

        when(
          mockRemoteRepository.downloadUrl(pathStorage: '1234'),
        ).thenAnswer(
          (_) async => 'url',
        );

        expect(
          await pickImageUseCase.downUrlImageStorage(
            imagePathStorage: '1234',
          ),
          isA<String>(),
        );
      });
    },
  );
}
