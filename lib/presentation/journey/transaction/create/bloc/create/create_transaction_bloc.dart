import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_smart_wallet/common/configs/default_environment.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/common/utils/validator.dart';
import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/create/create_transaction_state.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';
import 'package:flutter_smart_wallet/use_case/transaction_use_case.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';

class CreateTransactionBloc extends BaseBloc<CreateTransactionState> {
  final TransactionUseCase _transactionUseCase;
  final UserUseCase _useCase;
  final PickImageUseCase _pickImageUseCase;
  final SnackbarBloc _snackbarBloc;
  final LoadingBloc _loadingBloc;

  late String _uid;
  CreateTransactionBloc(this._transactionUseCase, this._useCase,
      this._pickImageUseCase, this._snackbarBloc, this._loadingBloc)
      : super(
          CreateTransactionState.initial(),
        ) {
    _uid = 'ra1g58S8I1a5BDwAP7BMAk6nakF2';
  }

  @override
  void onConnected() {}

  Future<void> initial(TransactionModel transaction) async {
    emit(
      state.copyWith(
        amount: transaction.amount,
        wallet: transaction.wallet,
        category: transaction.category,
        photo: transaction.photos,
        spendTime: DateTime.fromMillisecondsSinceEpoch(transaction.spendTime),
        buttonIsValid: AppValidator.validateCreateTransactionButton(
          transaction.amount,
          transaction.category,
          DateTime.fromMillisecondsSinceEpoch(transaction.spendTime),
          transaction.wallet,
        ),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> chooseCategory(CategoryModel? category) async {
    emit(
      state.copyWith(
        category: category,
        buttonIsValid: AppValidator.validateCreateTransactionButton(
            state.amount, category, state.spendTime, state.wallet),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> changeSpendTime(DateTime spendTime) async {
    emit(
      state.copyWith(
        spendTime: spendTime,
        buttonIsValid: AppValidator.validateCreateTransactionButton(
            state.amount, state.category, spendTime, state.wallet),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> chooseWallet(WalletModel? wallet) async {
    emit(
      state.copyWith(
        wallet: wallet,
        buttonIsValid: AppValidator.validateCreateTransactionButton(
            state.amount, state.category, state.spendTime, wallet),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> onChangeAmount(int amount) async {
    emit(
      state.copyWith(
        amount: amount,
        buttonIsValid: AppValidator.validateCreateTransactionButton(
            amount, state.category, state.spendTime, state.wallet),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> onCreate(
      {String? note, List<Uint8List> photos = const []}) async {
    _loadingBloc.startLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        TransactionModel transaction = TransactionModel(
            amount: state.amount!,
            category: state.category!,
            spendTime: state.spendTime.millisecondsSinceEpoch,
            wallet: state.wallet!,
            note: note,
            createAt: DateTime.now().millisecondsSinceEpoch,
            lastUpdate: DateTime.now().millisecondsSinceEpoch);
        final transactionId =
            await _transactionUseCase.addTransaction(_uid, transaction);
        log('transaction id : $transactionId');
        final List<String> imagePaths = [];
        for (final photo in photos) {
          final String storagePath =
              '$_uid/${DefaultEnvironment.transaction}/$transactionId/${DateTime.now().millisecondsSinceEpoch}.png';
          // final path = await _pickImageUseCase.upAndDownImage(
          //     imageToUpload: photo, imagePathStorage: storagePath);
          //imagePaths.add(path);
        }
        transaction =
            transaction.copyWith(id: transactionId, photos: imagePaths);
        _transactionUseCase.updateTransaction(_uid, transaction);
        _loadingBloc.finishLoading();
        emit(
          state.copyWith(
            status: CreateTransactionStatus.succes,
            lastUpdate: DateTime.now(),
          ),
        );
      } on FirebaseException catch (e) {
        emit(
          state.copyWith(
            status: CreateTransactionStatus.failed,
            lastUpdate: DateTime.now(),
          ),
        );
        log('error code: ${e.code}');
        log('error message: ${e.message}');
        _loadingBloc.finishLoading();
        _snackbarBloc.showSnackbar(
            translationKey: e.message ?? '', type: SnackBarType.error);
      }
    } else {
      _loadingBloc.finishLoading();
      state.copyWith(
        status: CreateTransactionStatus.noInternet,
        lastUpdate: DateTime.now(),
      );
      _snackbarBloc.showSnackbar(
          translationKey: 'no_internet_connection', type: SnackBarType.error);
    }
  }

  Future<void> onEdit({required String id, String? note}) async {
    _loadingBloc.startLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        _transactionUseCase.updateTransaction(
          _uid,
          TransactionModel(
              id: id,
              amount: state.amount!,
              category: state.category!,
              spendTime: state.spendTime.millisecondsSinceEpoch,
              wallet: state.wallet!,
              photos: state.photo,
              note: note,
              createAt: DateTime.now().millisecondsSinceEpoch,
              lastUpdate: DateTime.now().millisecondsSinceEpoch),
        );
        _loadingBloc.finishLoading();
        emit(
          state.copyWith(
            status: CreateTransactionStatus.succes,
            lastUpdate: DateTime.now(),
          ),
        );
      } on FirebaseException catch (e) {
        _loadingBloc.finishLoading();
        emit(
          state.copyWith(status: CreateTransactionStatus.failed),
        );
        _snackbarBloc.showSnackbar(
            translationKey: e.message ?? '', type: SnackBarType.error);
      }
    } else {
      _loadingBloc.finishLoading();
      state.copyWith(status: CreateTransactionStatus.noInternet);
      _snackbarBloc.showSnackbar(
          translationKey: 'no_internet_connection', type: SnackBarType.error);
    }
  }
}
