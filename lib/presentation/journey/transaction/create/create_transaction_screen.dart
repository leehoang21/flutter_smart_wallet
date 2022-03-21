import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create_transaction_bloc/create_transaction_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create_transaction_bloc/create_transaction_state.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/widget/create_transaction_form.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/widget/inovoice_photos_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class CreateTransactionScreen extends StatefulWidget {
  @override
  State<CreateTransactionScreen> createState() =>
      _CreateTransactionScreenState();
}

class _CreateTransactionScreenState extends State<CreateTransactionScreen> {
  final TextEditingController _amountCtrl = TextEditingController();

  final TextEditingController _walletCtrl = TextEditingController();

  final TextEditingController _categoryCtl = TextEditingController();

  final TextEditingController _dateCtl = TextEditingController();

  final TextEditingController _noteCtl = TextEditingController();

  late CreateTransactionBloc _createTransactionBloc;

  @override
  void initState() {
    _createTransactionBloc = BlocProvider.of<CreateTransactionBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _walletCtrl.dispose();
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
              walletCtrl: _walletCtrl,
              categoryCtl: _categoryCtl,
              dateCtl: _dateCtl,
              noteCtl: _noteCtl,
            ),
            SizedBox(
              height: CreateTransactionConstants.sizedBoxHeight12,
            ),
            Expanded(
              child: InvoicePhotosWidget(),
            ),
            BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
                bloc: _createTransactionBloc,
                buildWhen: (previous, current) =>
                    previous.buttonIsValid != current.buttonIsValid,
                builder: (context, state) {
                  return TextButtonWidget(
                      onPressed: state.buttonIsValid ? _onCreate : null,
                      title: CreateTransactionConstants.create);
                })
          ],
        ),
      ),
    );
  }

  void _onCreate() {
    _createTransactionBloc.onCreate();
  }
}
