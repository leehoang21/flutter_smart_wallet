import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';

class CreateTransactionForm extends StatelessWidget {
  final TextEditingController amountCtrl;
  final TextEditingController categoryCtl;
  final TextEditingController dateCtl;
  final TextEditingController noteCtl;
  final Function() selectDate;
  final Function() selectCategory;

  const CreateTransactionForm({
    Key? key,
    required this.amountCtrl,
    required this.categoryCtl,
    required this.dateCtl,
    required this.noteCtl,
    required this.selectDate,
    required this.selectCategory,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          controller: amountCtrl,
          prefixIcon: Image.asset(ImageConstants.coinIcon),
          hintText: '0đ',
        ),
        SizedBox(
          height: CreateTransactionConstants.sizedBoxHeight12,
        ),
        TextFieldWidget(
          controller: categoryCtl,
          prefixIcon: Image.asset(ImageConstants.category),
          hintText: CreateTransactionConstants.category,
          readOnly: true,
        ),
        SizedBox(
          height: CreateTransactionConstants.sizedBoxHeight12,
        ),
        TextFieldWidget(
          controller: dateCtl,
          prefixIcon: Image.asset(ImageConstants.calendar),
          hintText: 'Today',
          readOnly: true,
        ),
        SizedBox(
          height: CreateTransactionConstants.sizedBoxHeight12,
        ),
        TextFieldWidget(
          controller: noteCtl,
          prefixIcon: Image.asset(ImageConstants.note),
          hintText: CreateTransactionConstants.note,
        ),
      ],
    );
  }
}
