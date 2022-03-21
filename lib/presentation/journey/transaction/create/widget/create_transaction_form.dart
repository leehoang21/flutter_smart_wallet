import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/utils/format_utils.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create_transaction_bloc/create_transaction_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create_transaction_bloc/create_transaction_state.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/common/extensions/date_time_extension.dart';

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
          prefixIcon: Image.asset(ImageConstants.coinIcon),
          inputFormatter: [
            AmountInputFormatter(),
            LengthLimitingTextInputFormatter(12),
          ],
          hintText: '0₫',
          onChanged: (value) {
            _createTransactionBloc
                .onChangeAmount(value.replaceAll(new RegExp(r'[^0-9]'), ''));
          },
        ),
        SizedBox(
          height: CreateTransactionConstants.sizedBoxHeight12,
        ),
        TextFieldWidget(
          controller: widget.walletCtrl,
          prefixIcon: Image.asset(ImageConstants.wallet),
          hintText: CreateTransactionConstants.category,
          readOnly: true,
        ),
        SizedBox(
          height: CreateTransactionConstants.sizedBoxHeight12,
        ),
        TextFieldWidget(
          controller: widget.categoryCtl,
          prefixIcon: Image.asset(ImageConstants.category),
          hintText: CreateTransactionConstants.category,
          readOnly: true,
        ),
        SizedBox(
          height: CreateTransactionConstants.sizedBoxHeight12,
        ),
        TextFieldWidget(
          controller: widget.dateCtl,
          prefixIcon: Image.asset(ImageConstants.calendar),
          hintText: 'Today',
          readOnly: true,
          onTap: _selectDate,
        ),
        SizedBox(
          height: CreateTransactionConstants.sizedBoxHeight12,
        ),
        TextFieldWidget(
          controller: widget.noteCtl,
          prefixIcon: Image.asset(ImageConstants.note),
          hintText: CreateTransactionConstants.note,
        ),
      ],
    );
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
