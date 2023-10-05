import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/common/utils/internet_checker.dart';
import 'package:flutter_smart_wallet/model/wallet_model.dart';
import 'package:flutter_smart_wallet/model/wallet_type_model.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/use_case/wallet_list_use_case.dart';

class CreateWalletState extends Equatable {
  final WalletTypeModel walletTypeModel;
  final int balance;
  final String walletName;
  final WalletTypeModel walletTypeSelecting;
  final ButtonState buttonState;
  final String? walletImage;

  CreateWalletState(
      {required this.walletTypeModel,
      required this.balance,
      required this.walletName,
      required this.walletTypeSelecting,
      this.walletImage,
      required this.buttonState});

  CreateWalletState update(
          {WalletTypeModel? walletTypeModel,
          int? balance,
          String? walletName,
          WalletTypeModel? walletTypeSelecting,
          ButtonState? buttonState,
          String? walletImage}) =>
      CreateWalletState(
          walletTypeModel: walletTypeModel ?? this.walletTypeModel,
          balance: balance ?? this.balance,
          walletName: walletName ?? this.walletName,
          walletTypeSelecting: walletTypeSelecting ?? this.walletTypeSelecting,
          buttonState: buttonState ?? this.buttonState,
          walletImage: walletImage ?? this.walletImage);

  @override
  List<Object?> get props => [
        this.walletTypeModel,
        this.balance,
        this.walletName,
        this.walletTypeSelecting,
        this.buttonState
      ];
}

class CreateWalletCubit extends Cubit<CreateWalletState> {
  final WalletUseCase walletUseCase;
  final SnackbarBloc snackbarBloc;

  CreateWalletCubit({required this.walletUseCase, required this.snackbarBloc})
      : super(CreateWalletState(
            walletTypeModel: walletTypeList.first,
            walletTypeSelecting: walletTypeList.first,
            balance: 0,
            walletName: '',
            buttonState: ButtonState.inactive));

  void onChangedWalletTypeSelecting(WalletTypeModel walletTypeModel) {
    emit(state.update(walletTypeSelecting: walletTypeModel));
  }

  void onChangedWalletTypeSelected() {
    emit(state.update(walletTypeModel: state.walletTypeSelecting));
  }

  void onChangedWalletName(String name) {
    emit(state.update(walletName: name));
  }

  void onChangedWalletImage(String image) {
    emit(state.update(walletImage: image));
  }

  void onChangedButtonState(bool active) {
    emit(state.update(
        buttonState: active ? ButtonState.active : ButtonState.inactive));
  }

  Future<void> onCreateWallet(BuildContext context,
      {required String name,
      required String balance,
      required imagePath}) async {
    if (await InternetChecker.hasConnection()) {
      try {
        WalletModel newWallet = WalletModel(
          walletName: name,
          balance: int.parse(
              balance.substring(0, balance.length - 1).replaceAll(",", "")),
          walletImage: imagePath,
          walletType: state.walletTypeModel.id,
          createAt: DateTime.now().millisecondsSinceEpoch,
          lastUpdate: DateTime.now().millisecondsSinceEpoch,
        );
        final result = await walletUseCase.addAndUpdateWalletListFirebase(
            walletModel: newWallet);
        if (result) {
          snackbarBloc.showSnackbar(
              translationKey: 'success', type: SnackBarType.success);
          emit(state.update(
              walletTypeModel: walletTypeList.first,
              walletTypeSelecting: walletTypeList.first,
              balance: 0,
              walletName: '',
              buttonState: ButtonState.inactive));
          Navigator.pop(context, true);
        }
      } catch (e) {
        snackbarBloc.showSnackbar(
            translationKey: 'error_message', type: SnackBarType.error);
      }
    } else {
      snackbarBloc.showSnackbar(
          translationKey: 'error_message', type: SnackBarType.error);
    }
  }
}
