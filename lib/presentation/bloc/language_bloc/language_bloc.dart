import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/language_bloc/language_state.dart';

class LanguageBloc extends Cubit<LanguageState> {
  LanguageBloc() : super(LanguageState.initial());

  Future<void> updateLanguage(Locale locale) async {
    emit(
      state.copyWith(
        status: LanguageStatus.loading,
        locale: locale,
      ),
    );
    await Future.delayed(Duration(microseconds: 500));
    emit(
      state.copyWith(
        status: LanguageStatus.success,
        locale: locale,
      ),
    );
  }
}
