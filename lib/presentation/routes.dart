import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/presentation/journey/main/main_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/splash/splash_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/bank_list_screen/bank_list_screen.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/add_photo_bloc/add_photo_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create_transaction_bloc/create_transaction_bloc.dart';
import 'journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case RouteList.createTransaction:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => injector.get<AddPhotoBloc>(),
              ),
              BlocProvider(
                create: (_) => injector.get<CreateTransactionBloc>(),
              )
            ],
            child: CreateTransactionScreen(),
          ),
        );
      case RouteList.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case RouteList.bankListScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => injector.get<BankSearchCubit>(),
            child: BankListScreen(),
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
