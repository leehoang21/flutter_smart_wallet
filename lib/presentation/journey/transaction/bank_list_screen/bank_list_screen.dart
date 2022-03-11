import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/bank_list_screen/bank_list_screen_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/loading_widget/loader_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';

class BankListScreen extends StatelessWidget {
  BankListScreen({Key? key}) : super(key: key);

  final bankSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: BankListScreenConstants.title),
      body: Padding(
        padding: EdgeInsets.all(BankListScreenConstants.viewPadding),
        child: Column(
          children: [
            TextFieldWidget(
              controller: bankSearchController
                ..addListener(
                  () {
                    context
                        .read<BankSearchCubit>()
                        .search(bankSearchController.text);
                  },
                ),
              hintText: BankListScreenConstants.searchBarHint,
              suffixIcon: IconButton(
                  onPressed: () {
                    bankSearchController.clear();
                  },
                  icon: Icon(Icons.close)),
            ),
            Expanded(
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
                            width: BankListScreenConstants.logoImmageWidth,
                          ),
                          onTap: () {
                            // TODO(hung): handle adding bank info
                          },
                        );
                      },
                      itemCount: bankList.length,
                    );
                  }
                  if (state is BankSearchNoResult) {
                    return Center(
                      child: Text(BankListScreenConstants.noResultText),
                    );
                  }

                  if (state is BankSearchError) {
                    return Center(
                      child: Text(BankListScreenConstants.errorMessage),
                    );
                  }
                  return LoaderWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
