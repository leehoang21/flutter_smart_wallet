import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/argument_constants.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/utils/format_utils.dart';
import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create/create_transaction_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create/create_transaction_state.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/common/extensions/date_time_extension.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CreateTransactionForm extends StatefulWidget {
  final TextEditingController amountCtrl;
  final TextEditingController walletCtrl;
  final TextEditingController categoryCtl;
  final TextEditingController dateCtl;
  final TextEditingController noteCtl;

  const CreateTransactionForm({
    Key? key,
    required this.amountCtrl,
    required this.walletCtrl,
    required this.categoryCtl,
    required this.dateCtl,
    required this.noteCtl,
  }) : super(key: key);

  @override
  State<CreateTransactionForm> createState() => _CreateTransactionFormState();
}

class _CreateTransactionFormState extends State<CreateTransactionForm> {
  late CreateTransactionBloc _createTransactionBloc;

  @override
  void initState() {
    _createTransactionBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          controller: widget.amountCtrl,
          keyboardType: TextInputType.numberWithOptions(signed: true),
          prefixIcon: AppImageWidget(
            path: ImageConstants.coinIcon,
          ),
          inputFormatter: [
            AmountInputFormatter(),
            LengthLimitingTextInputFormatter(12),
          ],
          hintText: '0₫',
          onChanged: (value) {
            _createTransactionBloc.onChangeAmount(
              int.parse(
                value.replaceAll(new RegExp(r'[^0-9]'), ''),
              ),
            );
          },
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: widget.walletCtrl,
          prefixIcon: AppImageWidget(
            path: ImageConstants.wallet,
          ),
          hintText: CreateTransactionConstants.chooseAWallet,
          readOnly: true,
          onTap: _chooseWallet,
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
            bloc: _createTransactionBloc,
            buildWhen: (previous, current) =>
                previous.category != current.category,
            builder: (context, state) {
              return TextFieldWidget(
                controller: widget.categoryCtl,
                prefixIcon: AppImageWidget(
                    path: state.category != null
                        ? "${ImageConstants.path}${state.category!.name!.toLowerCase()}.png"
                        : ImageConstants.category),
                hintText: CreateTransactionConstants.category,
                readOnly: true,
                onTap: () => _chooseCategory(state.category),
              );
            }),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: widget.dateCtl,
          prefixIcon: AppImageWidget(path: ImageConstants.calendar),
          hintText: 'To day',
          readOnly: true,
          onTap: _selectDate,
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: widget.noteCtl,
          prefixIcon: AppImageWidget(path: ImageConstants.note),
          hintText: CreateTransactionConstants.note,
        ),
      ],
    );
  }

  Future<void> _chooseCategory(CategoryModel? currentCategory) async {
    final category = await Navigator.pushNamed(
      context,
      RouteList.categoryScreen,
      arguments: {ArgumentConstants.category: currentCategory},
    );
    if (category != null) {
      _createTransactionBloc.chooseCategory(category as CategoryModel);
      widget.categoryCtl.text = translate(
          "transaction_category_screen_${category.name!.toLowerCase()}");
    }
  }

  Future<void> _chooseWallet() async {
    final wallet =
        await Navigator.pushNamed(context, RouteList.walletListScreen);
    if (wallet != null) {
      _createTransactionBloc.chooseWallet(wallet as WalletModel);
      widget.walletCtrl.text = wallet.walletName ?? '';
    }
  }

  void _selectDate() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
            bloc: _createTransactionBloc,
            buildWhen: (previous, current) =>
                previous.spendTime != current.spendTime,
            builder: (context, state) {
              return CupertinoDatePicker(
                onDateTimeChanged: _onChangeDate,
                initialDateTime: state.spendTime,
                mode: CupertinoDatePickerMode.date,
                maximumDate: DateTime.now(),
              );
            },
          ),
        );
      },
    );
  }

  void _onChangeDate(DateTime date) {
    widget.dateCtl.text = date.getTextDate;
    _createTransactionBloc.changeSpendTime(date);
  }
}
