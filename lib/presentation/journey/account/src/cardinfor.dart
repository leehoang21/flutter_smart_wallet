import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/cubit/account_cubit.dart';

class CardInfor extends StatelessWidget {
  CardInfor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.watch<AccountCubit>().state.userModel.userName,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.start,
        ),
        Text(
          context.watch<AccountCubit>().state.userModel.email ?? '',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        Text(
          context.watch<AccountCubit>().state.userModel.phoneNumber,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
