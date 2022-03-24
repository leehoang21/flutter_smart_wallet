import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_wallet/model/user_model.dart';
import 'package:flutter_smart_wallet/repository/remote/register_repository.dart';
import 'package:flutter_smart_wallet/use_case/register_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_use_case_test.mocks.dart';

@GenerateMocks([RegisterRepository])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('test register usecase', () {
    final MockRegisterRepository mockRegisterRepository =
        MockRegisterRepository();
    final RegisterUseCase registerUseCase = RegisterUseCase(
      mockRegisterRepository,
    );

    test('addUser return true', () async {
      when(
        mockRegisterRepository.hasconnection(),
      ).thenAnswer(
        (realInvocation) async => true,
      );

      when(
        mockRegisterRepository.addUser(
          'userId',
          {
            'phoneNumber': '0123456789',
          },
        ),
      );

      expect(
        await registerUseCase.addUser(
          'userId',
          UserModel(
            phoneNumber: '+84123456789',
          ),
        ),
        isA<bool>(),
      );
    });

    test('addUser no internet', () async {
      when(
        mockRegisterRepository.hasconnection(),
      ).thenAnswer(
        (realInvocation) async => false,
      );

      when(
        mockRegisterRepository.addUser(
          'userId',
          {
            'phoneNumber': '0123456789',
          },
        ),
      );

      expect(
        () async => await registerUseCase.addUser(
          'userId',
          UserModel(
            phoneNumber: '+84123456789',
          ),
        ),
        throwsA(
          'No internet connection',
        ),
      );
    });

    test('addUser return throw', () async {
      when(
        mockRegisterRepository.hasconnection(),
      ).thenAnswer(
        (realInvocation) async => true,
      );

      when(
        mockRegisterRepository.addUser(
          'userId',
          {
            'phoneNumber': '0123456789',
          },
        ),
      ).thenThrow(Exception('error'));

      expect(
        await registerUseCase.addUser(
          'userId',
          UserModel(
            phoneNumber: '+84123456789',
          ),
        ),
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });
}
