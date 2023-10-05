import 'package:flutter_translate/flutter_translate.dart';

extension TranslateExtension on String {
  /// Creates adapt String using r [SizeExtension].
  String get tr => translate(this);
}
