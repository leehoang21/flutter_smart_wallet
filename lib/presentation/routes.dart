import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/argument_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/presentation/journey/main/main_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/cubit/register_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/register_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/splash_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/bank_list_screen/bank_list_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create_transaction_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/category_screen/bloc/category_select_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/category_screen/category_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/wallet/screens/wallet_list_screen/wallet_list_screen.dart';
import 'journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart';
import 'journey/wallet/screens/wallet_list_screen/bloc/wallet_list_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final _argument = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RouteList.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Injector.getIt.get<RegisterCubit>(),
            child: RegisterScreen(),
          ),
        );
      case RouteList.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case RouteList.createTransaction:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => Injector.getIt.get<CreateTransactionBloc>(),
              )
            ],
            child: CreateTransactionScreen(
              transaction: _argument?[ArgumentConstants.transaction],
            ),
          ),
        );
      case RouteList.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case RouteList.categoryScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => CategorySelectCubit(),
                  child: CategoryScreen(),
                ));
      case RouteList.bankListScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Injector.getIt.get<BankSearchCubit>(),
            child: BankListScreen(),
          ),
        );
      case RouteList.walletListScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Injector.getIt<WalletListCubit>(),
            child: WalletListScreen(),
          ),
        );
      default:
        return _emptyRoute(settings);
    }
  }

  static MaterialPageRoute _emptyRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}
