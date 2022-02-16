import 'package:flutter/foundation.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';

abstract class SnackbarEvent {}

class ShowSnackbar extends SnackbarEvent {
  String translationKey;
  SnackBarType type;
  List<dynamic>? params;
  Key? key;

  ShowSnackbar({
    this.translationKey = '',
    required this.type,
    this.params,
    this.key,
  });
}
