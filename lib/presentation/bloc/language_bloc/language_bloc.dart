import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/language_constants.dart';
import 'package:flutter_smart_wallet/presentation/bloc/language_bloc/language_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageBloc extends Cubit<LanguageState> {
  LanguageBloc() : super(LanguageState.initial());

  Future<void> loadLanguageFromSharePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final locale = Locale(prefs.getString('lang') ?? LanguageConstants.en);
    emit(
      state.copyWith(
        status: LanguageStatus.success,
        locale: locale,
      ),
    );
  }

  Future<void> updateLanguage(Locale locale) async {
    emit(
      state.copyWith(
        status: LanguageStatus.loading,
        locale: locale,
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', locale.toString());
    emit(
      state.copyWith(
        status: LanguageStatus.success,
        locale: locale,
      ),
    );
  }
}
