import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/model/bank_info_model.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/screens/bank_list_screen/bloc/bank_search_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/loading_widget/loader_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/use_case/vn_bank_usse_case.dart';

class BankListScreen extends StatelessWidget {
  const BankListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BankSearchCubit>(
      create: (context) => BankSearchCubit(),
      child: Scaffold(
        appBar: AppBarWidget(title: "Choose a bank"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _BuildSearchBar(),
              _BuildBankList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildBankList extends StatelessWidget {
  const _BuildBankList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BankSearchCubit, BankSearchState>(
        builder: (context, state) {
          if (state is BankSearchLoaded) {
            final bankList = state.bankList;
            return ListView.builder(
              itemBuilder: (context, index) {
                final bank = bankList[index];
                return ListTile(
                  title: Text("${bank.shortName!} (${bank.code!})"),
                  subtitle: Text(bank.name!),
                  leading: Image.network(
                    bank.logo!,
                    width: 80.sp,
                  ),
                  onTap: () {
                    // TODO: handle adding bank info
                  },
                );
              },
              itemCount: bankList.length,
            );
          }
          if (state is BankSearchNoResult) {
            return Center(
              child: Text("No result"),
            );
          }

          if (state is BankSearchError) {
            return Center(
              child: Text(state.error),
            );
          }
          return LoaderWidget();
        },
      ),
    );
  }
}

class _BuildSearchBar extends StatelessWidget {
  _BuildSearchBar({
    Key? key,
  }) : super(key: key);

  final bankSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      controller: bankSearchController
        ..addListener(() {
          context.read<BankSearchCubit>().search(bankSearchController.text);
        }),
      hintText: "Search bank",
    );
  }
}
