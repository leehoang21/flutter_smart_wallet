// Mocks generated by Mockito 5.1.0 from annotations
// in flutter_smart_wallet/test/usecase/vn_bank_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_smart_wallet/common/configs/dio_config/base_response.dart'
    as _i2;
import 'package:flutter_smart_wallet/repository/remote/vn_bank_repository.dart'
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

class _FakeBaseResponse_0 extends _i1.Fake implements _i2.BaseResponse {}

/// A class which mocks [VnBankRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockVnBankRepository extends _i1.Mock implements _i3.VnBankRepository {
  MockVnBankRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.BaseResponse> getVnBankList() => (super.noSuchMethod(
          Invocation.method(#getVnBankList, []),
          returnValue: Future<_i2.BaseResponse>.value(_FakeBaseResponse_0()))
      as _i4.Future<_i2.BaseResponse>);
}
