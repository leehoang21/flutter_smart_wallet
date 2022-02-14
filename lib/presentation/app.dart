
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/language_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/constants/strings/string_constants.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/splash_screen.dart';
import 'package:flutter_smart_wallet/themes/theme_data.dart';
import 'package:flutter_translate/flutter_translate.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    return ScreenUtilInit(
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => Injector.resolve<LanguageBloc>(),
          ),
          BlocProvider(
            create: (_) => Injector.resolve<LoadingBloc>(),
          )
        ],
        child: GestureDetector(
            onTap: () {
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: MaterialApp(
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                localizationDelegate,
              ],
              title: StringConstants.appTitle,
              initialRoute: RouteList.splashScreen,
              locale: localizationDelegate.currentLocale,
              supportedLocales: const [
                Locale(LanguageConstants.en),
                Locale(LanguageConstants.vi)
              ],
              routes: {
                RouteList.splashScreen: (_) => const SplashScreen(),
              },
              theme: appTheme(),
            )),
      ),
    );
  }
}
