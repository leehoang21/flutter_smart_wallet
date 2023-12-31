import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/constants/strings/string_constants.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/presentation/bloc/language_bloc/language_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_smart_wallet/presentation/routes.dart';
import 'package:flutter_smart_wallet/presentation/widgets/loading_widget/loading_container_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/snackbar_widget/snackbar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_data.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../common/constants/language_constants.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    return ScreenUtilInit(
      designSize: Size(
        LayoutConstants.widthDefault,
        LayoutConstants.heightDefault,
      ),
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => Injector.getIt.get<LanguageBloc>(),
          ),
          BlocProvider(
            create: (_) => Injector.getIt.get<LoadingBloc>(),
          ),
          BlocProvider(
            create: (_) => Injector.getIt.get<SnackbarBloc>(),
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
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigator,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              localizationDelegate,
            ],
            title: StringConstants.appTitle,
            initialRoute: RouteList.splashScreen,
            locale: localizationDelegate.currentLocale,
            supportedLocales: [
              Locale(LanguageConstants.en),
              Locale(LanguageConstants.vi)
            ],
            onGenerateRoute: Routes.generateRoute,
            theme: appTheme(),
            builder: (context, widget) {
              return LoadingContainerWidget(
                child: _buildBlocListener(widget ?? SizedBox(), context),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBlocListener(Widget widget, BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SnackbarBloc, SnackbarState>(
          listener: (context, state) {
            if (state is ShowSnackBarState) {
              TopSnackBar(
                title: translate(state.translationKey ?? ''),
                type: state.type ?? SnackBarType.success,
                key: state.key,
              ).showWithNavigator(
                  _navigator.currentState ?? NavigatorState(), context);
            }
          },
        ),
      ],
      child: widget,
    );
  }
}
