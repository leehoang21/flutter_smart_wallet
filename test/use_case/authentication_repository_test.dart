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

    test('return UserCredential when calling userCredential()', () async {
      when(mockAuthenticationRepository.userCredential('id', 'code'))
          .thenAnswer((_) async => mockUserCredential);

      expect(await authenticationUseCase.userCredential('id', 'code'),
          isA<UserCredential>());
    });
  });
}
