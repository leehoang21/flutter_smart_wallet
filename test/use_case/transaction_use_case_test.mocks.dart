// Mocks generated by Mockito 5.1.0 from annotations
// in flutter_smart_wallet/test/use_case/transaction_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_smart_wallet/common/configs/firebase_config.dart'
    as _i2;
import 'package:flutter_smart_wallet/model/transaction_model.dart' as _i5;
import 'package:flutter_smart_wallet/repository/remote/transaction/transaction_remote_repository.dart'
    as _i3;
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

class _FakeFirebaseConfig_0 extends _i1.Fake implements _i2.FirebaseConfig {}

/// A class which mocks [TransactionRemoteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTransactionRemoteRepository extends _i1.Mock
    implements _i3.TransactionRemoteRepository {
  MockTransactionRemoteRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseConfig get firebaseConfig =>
      (super.noSuchMethod(Invocation.getter(#firebaseConfig),
          returnValue: _FakeFirebaseConfig_0()) as _i2.FirebaseConfig);
  @override
  _i4.Future<String> createTransaction(
          String? uid, Map<String, dynamic>? transactionData) =>
      (super.noSuchMethod(
          Invocation.method(#createTransaction, [uid, transactionData]),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<bool> updateTransaction(
          String? uid, _i5.TransactionModel? transaction) =>
      (super.noSuchMethod(
          Invocation.method(#updateTransaction, [uid, transaction]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
