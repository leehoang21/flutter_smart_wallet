import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create_transaction_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create_transaction_state.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/widget/create_transaction_form.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/widget/inovoice_photos_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/keyboard_avoider/keyboard_avoider.dart';
import 'package:flutter_smart_wallet/presentation/widgets/scaffold_wdiget/scaffold_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/common/extensions/date_time_extension.dart';
import 'package:flutter_smart_wallet/common/extensions/num_extension.dart  ';

class CreateTransactionScreen extends StatefulWidget {
  final TransactionModel? transaction;

  const CreateTransactionScreen({Key? key, this.transaction}) : super(key: key);
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

  TransactionModel? _transaction;

  @override
  void initState() {
    _transaction = widget.transaction;
    _createTransactionBloc = BlocProvider.of<CreateTransactionBloc>(context);
    if (_transaction != null) {
      _amountCtrl.text = _transaction!.amount.getTextAmount;
      _walletCtrl.text = _transaction!.category.name!;
      _dateCtl.text =
          DateTime.fromMillisecondsSinceEpoch(_transaction!.spendTime)
              .getTextDate;
      _noteCtl.text = _transaction?.note ?? '';
      _createTransactionBloc.initial(_transaction!);
    }
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
      body: BlocListener<CreateTransactionBloc, CreateTransactionState>(
        bloc: _createTransactionBloc,
        listener: (context, state) {
          if (state.status == CreateTransactionStatus.succes) {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: LayoutConstants.paddingTop24,
          ),
          child: Column(
            children: [
              Expanded(
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
                    InvoicePhotosWidget(),
                  ],
                ),
              ),
              BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
                bloc: _createTransactionBloc,
                buildWhen: (previous, current) =>
                    previous.buttonIsValid != current.buttonIsValid,
                builder: (context, state) {
                  return TextButtonWidget(
                      onPressed: state.buttonIsValid
                          ? _transaction != null
                              ? _onEdit
                              : _onCreate
                          : null,
                      title: _transaction != null
                          ? CreateTransactionConstants.update
                          : CreateTransactionConstants.create);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onCreate() {
    _createTransactionBloc.onCreate(note: _noteCtl.text);
  }

  void _onEdit() {
    _createTransactionBloc.onEdit(id: _transaction!.id!, note: _noteCtl.text);
  }
}
