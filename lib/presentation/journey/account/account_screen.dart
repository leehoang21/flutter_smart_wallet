import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/extensions/translate_extension.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/account_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/cubit/account_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/src/categories.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/src/information.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/src/version.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key ?? AccountConstants.key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injector.getIt.get<AccountCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "My Page".tr,
              style: TextStyle(fontSize: 23, color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Information(),
                Categories(),
                version(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
