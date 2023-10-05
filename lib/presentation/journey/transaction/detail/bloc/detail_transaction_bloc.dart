import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/presentation/bloc/base_bloc/base_bloc.dart';

import '../../../../../common/utils/app_utils.dart';
import '../../../../../use_case/pick_image_use_case.dart';

part 'detail_transaction_state.dart';

class DetailTransactionBloc extends BaseBloc<DetailTransactionState> {
  DetailTransactionBloc(this.pickImageUseCase)
      : super(DetailTransactionState.initial());
  final PickImageUseCase pickImageUseCase;

  init(TransactionModel data) async {
    List<String> photos = [];
    for (final item in data.photos ?? []) {
      if (!isNullEmpty(item)) {
        final icon =
            await pickImageUseCase.downUrlImageStorage(imagePathStorage: item);
        photos.add(icon);
      }
    }
    emit(state.copyWith(data: data.copyWith(photos: photos)));
  }

  @override
  void onConnected() {}
}
