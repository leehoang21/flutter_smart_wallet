import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:flutter_smart_wallet/repository/remote/user/user_remote_repository.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'user_use_case_test.mocks.dart';

@GenerateMocks([FirebaseAuth, UserRemoteRepository])
void main() {
  group('test user use case', () {
    final MockUserRemoteRepository mockUserRemoteRepository =
        MockUserRemoteRepository();
    final UserUseCase userUseCase = UserUseCase(mockUserRemoteRepository);
    final UserModel userModel = UserModel(phoneNumber: '');

    test('return string when calling getuserID()', () async {
      when(
        mockUserRemoteRepository.getUserId(),
      ).thenReturn('');
      expect(userUseCase.getUid(), isA<String>());
    });

    test('return string when calling getPhoneNumber()', () {
      when(
        mockUserRemoteRepository.getPhoneNumber(),
      ).thenReturn('');
      expect(userUseCase.getPhoneNumber(), isA<String>());
    });

    test('return false when calling hasConnection', () async {
      when(
        mockUserRemoteRepository.hasconnection(),
      ).thenAnswer((realInvocation) async => false);
      expect(
        () => userUseCase.hasconnection(),
        throwsA('no_internet'),
      );
    });

    test('return true when calling setUserFirestore() succeeded', () async {
      when(mockUserRemoteRepository.hasconnection())
          .thenAnswer((_) async => true);

      when(
        mockUserRemoteRepository.setUserFirestore(userModel.toJson()),
      ).thenAnswer((realInvocation) async => true);

      expect(
        await userUseCase.setUserFirestore(userModel),
        isA<bool>(),
      );
    });

    test('return true when calling hasUserFirestore() succeeded', () async {
      when(mockUserRemoteRepository.hasconnection())
          .thenAnswer((_) async => true);

      when(
        mockUserRemoteRepository.hasUserFirestore(),
      ).thenAnswer((_) async => true);

      expect(
        await userUseCase.hasUserFirestore(),
        isA<bool>(),
      );
    });
  });
}
