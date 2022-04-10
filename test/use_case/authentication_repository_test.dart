import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_smart_wallet/repository/remote/authentication_repository.dart';
import 'package:flutter_smart_wallet/use_case/authentication_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_repository_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  group('test authentication use case', () {
    MockAuthenticationRepository mockAuthenticationRepository =
        MockAuthenticationRepository();

    MockUserCredential mockUserCredential = MockUserCredential();

    AuthenticationUseCase authenticationUseCase = AuthenticationUseCase(
      authenticationRepository: mockAuthenticationRepository,
    );

    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: 'verificationId',
      smsCode: 'smsCode',
    );

    test('return UserCredential when calling userCredential()', () async {
      when(mockAuthenticationRepository.userCredential(phoneAuthCredential))
          .thenAnswer((_) async => mockUserCredential);

      expect(await authenticationUseCase.userCredential(phoneAuthCredential),
          isA<UserCredential>());
    });

    test('return true when calling checkUserIsExist()', () {
      when(mockAuthenticationRepository.checkUserIsExist()).thenAnswer(
        (realInvocation) => true,
      );

      expect(authenticationUseCase.checkUserIsExist(), isTrue);
    });
  });
}
