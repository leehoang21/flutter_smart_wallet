import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/common/utils/validator.dart';
import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/add_photo_bloc/add_photo_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create_transaction_bloc/create_transaction_state.dart';
import 'package:flutter_smart_wallet/use_case/transaction_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateTransactionBloc extends BaseBloc<CreateTransactionState> {
  final TransactionUseCase _transactionUseCase;
  final AddPhotoBloc _addPhotoBloc;
  final SnackbarBloc _snackbarBloc;
  CreateTransactionBloc(
      this._transactionUseCase, this._addPhotoBloc, this._snackbarBloc)
      : super(CreateTransactionState.initial());

  @override
  void onConnected() {}

  Future<void> changeSpendTime(DateTime spendTime) async {
    emit(
      state.copyWith(
        spendTime: spendTime,
        buttonIsValid: AppValidator.validateCreataTransactionButton(
            state.amount, state.category, spendTime),
      ),
    );
  }

  Future<void> onChangeAmount(String amount) async {
    emit(
      state.copyWith(
        amount: amount,
        buttonIsValid: AppValidator.validateCreataTransactionButton(
            amount, CategoryModel(name: 'Eating'), state.spendTime),
      ),
    );
  }

  Future<void> onCreate() async {
    if (await InternetChecker.hasConnection()) {
    } else {
      state.copyWith(status: CreateTransactionStatus.noInternet);
      _snackbarBloc.showSnackbar(
          translationKey: 'No Internet', type: SnackBarType.error);
    }
  }
}
