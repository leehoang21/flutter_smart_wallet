// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_smart_wallet/test/use_case/wallet_list_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_smart_wallet/common/configs/firebase_config.dart'
    as _i2;
import 'package:flutter_smart_wallet/model/wallet_model.dart' as _i6;
import 'package:flutter_smart_wallet/repository/remote/wallet_repository.dart'
    as _i4;
import 'package:flutter_smart_wallet/use_case/user_use_case.dart' as _i3;
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

class _FakeFirebaseConfig_0 extends _i1.SmartFake
    implements _i2.FirebaseConfig {
  _FakeFirebaseConfig_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserUseCase_1 extends _i1.SmartFake implements _i3.UserUseCase {
  _FakeUserUseCase_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WalletRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWalletRepository extends _i1.Mock implements _i4.WalletRepository {
  MockWalletRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseConfig get firebaseConfig => (super.noSuchMethod(
        Invocation.getter(#firebaseConfig),
        returnValue: _FakeFirebaseConfig_0(
          this,
          Invocation.getter(#firebaseConfig),
        ),
      ) as _i2.FirebaseConfig);

  @override
  _i3.UserUseCase get userRemoteRepository => (super.noSuchMethod(
        Invocation.getter(#userRemoteRepository),
        returnValue: _FakeUserUseCase_1(
          this,
          Invocation.getter(#userRemoteRepository),
        ),
      ) as _i3.UserUseCase);

  @override
  _i5.Future<Map<dynamic, dynamic>> fetchWalletListFirebase() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchWalletListFirebase,
          [],
        ),
        returnValue:
            _i5.Future<Map<dynamic, dynamic>>.value(<dynamic, dynamic>{}),
      ) as _i5.Future<Map<dynamic, dynamic>>);

  @override
  _i5.Future<bool> addAndUpdateWalletListFirebase(
          {required _i6.WalletModel? walletModel}) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAndUpdateWalletListFirebase,
          [],
          {#walletModel: walletModel},
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
