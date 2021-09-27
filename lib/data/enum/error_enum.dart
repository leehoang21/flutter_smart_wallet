import 'package:get/get.dart';

class ErrorCodeEnum {
  static ErrorCode getErrorCode(String code) {
    return ErrorCode.values.where((value) => value.code == code).first;
  }
}

enum ErrorCode { none, noInternet, invalidOtp }

extension ErrorCodeExtension on ErrorCode {
  String get code {
    switch (this) {
      case ErrorCode.none:
        return '';
      case ErrorCode.noInternet:
        return 'network-request-failed';
      case ErrorCode.invalidOtp:
        return 'invalid-verification-code';
    }
  }

  String get message {
    switch (this) {
      case ErrorCode.none:
        return '';
      case ErrorCode.noInternet:
        return 'network_request_failed'.tr;
      case ErrorCode.invalidOtp:
        return 'otp_is_incorrect'.tr;
    }
  }
}
