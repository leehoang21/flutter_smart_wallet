import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/bank_list_screen/bank_list_screen_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/loading_widget/loader_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class BankListScreen extends StatefulWidget {
  BankListScreen({Key? key}) : super(key: key);

  @override
  State<BankListScreen> createState() => _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  final bankSearchController = TextEditingController();
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: BankListScreenConstants.title,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimens.space_8),
        child: Column(
          children: [
            TextFieldWidget(
              controller: bankSearchController
                ..addListener(
                  () {
                    context
                        .read<BankSearchCubit>()
                        .search(bankSearchController.text);
                    setState(() {
                      isEmpty = bankSearchController.text.isEmpty;
                    });
                  },
                ),
              hintText: BankListScreenConstants.searchBarHint,
              suffixIcon: !isEmpty
                  ? IconButton(
                      onPressed: () {
                        bankSearchController.clear();
                      },
                      icon: Icon(Icons.close, color: AppColor.ebonyClay))
                  : Icon(Icons.search, color: AppColor.ebonyClay),
            ),
            Expanded(
              child: BlocBuilder<BankSearchCubit, BankSearchState>(
                builder: (context, state) {
                  if (state is BankSearchLoaded) {
                    final bankList = state.bankList;
                    return ListView.builder(
                      key: ValueKey<String>("bankList"),
                      itemBuilder: (context, index) {
                        final bank = bankList[index];
                        return ListTile(
                          title: Text("${bank.shortName!} (${bank.code!})"),
                          subtitle: Text(bank.name!),
                          leading: Image.network(
                            bank.logo!,
                            width: AppDimens.space_72,
                          ),
                          onTap: () {
                            /// get selected bank by using bank object
                            /// e.g bank.id...
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
