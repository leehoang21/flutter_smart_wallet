import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/widget/create_transaction_form.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/widget/inovoice_photos_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class CreateTransactionScreen extends StatefulWidget {
  @override
  State<CreateTransactionScreen> createState() =>
      _CreateTransactionScreenState();
}

class _CreateTransactionScreenState extends State<CreateTransactionScreen> {
  final TextEditingController _amountCtrl = TextEditingController();

  final TextEditingController _categoryCtl = TextEditingController();

  final TextEditingController _dateCtl = TextEditingController();

  final TextEditingController _noteCtl = TextEditingController();

  @override
  void dispose() {
    _amountCtrl.dispose();
    _categoryCtl.dispose();
    _dateCtl.dispose();
    _noteCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: CreateTransactionConstants.addTransaction,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: LayoutConstants.paddingTop24,
        ),
        child: Column(
          children: [
            CreateTransactionForm(
              amountCtrl: _amountCtrl,
              categoryCtl: _categoryCtl,
              dateCtl: _dateCtl,
              noteCtl: _noteCtl,
              selectCategory: _selectCategory,
              selectDate: _selectDate,
            ),
            SizedBox(
              height: CreateTransactionConstants.sizedBoxHeight12,
            ),
            InvoicePhotosWidget(),
          ],
        ),
      ),
    );
  }

  void _selectCategory() {}

  void _selectDate() {}
}
