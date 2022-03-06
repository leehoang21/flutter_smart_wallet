import 'dart:developer';

void logger(String message) {
  log('app_logger: {$message}');
}

bool isNullEmpty(Object? o) => o == null || "" == o || o == "null";

bool isNullEmptyOrFalse(Object? o) => o == null || false == o || "" == o;

bool isNullEmptyFalseOrZero(Object? o) => o == null || false == o || 0 == o || "" == o || "0" == o;

bool isNullEmptyList<T>(List<T>? t) => t == null || [] == t || t.isEmpty;

bool isNullEmptyMap<T>(Map<T, T>? t) => t == null || {} == t || t.isEmpty;

bool isNumeric(dynamic s) {
  String sConvert = s.toString();
  if (isNullEmpty(sConvert)) {
    return false;
  }
  return (double.tryParse(sConvert) != null || int.tryParse(sConvert) != null);
}