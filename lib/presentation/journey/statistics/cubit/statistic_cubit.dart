import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:flutter_smart_wallet/use_case/transaction_use_case.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';

part 'statistic_state.dart';

class StatisticCubit extends BaseBloc<StatisticState> {
  StatisticCubit(this.useCase, this.userUseCase) : super(StatisticState());
  final TransactionUseCase useCase;
  final UserUseCase userUseCase;

  @override
  void onConnected() {
    getData();
    super.onConnected();
  }

  void getData() async {
    try {
      final uid = await userUseCase.getUid();
      final result = await useCase.getTransaction(uid);
      emit(state.copyWith(data: result, status: StatisticStateStatus.loaded));
    } catch (e) {
      logger(e.toString());
      emit(state.copyWith(status: StatisticStateStatus.error));
    }
  }

  double get _revenue {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      if (element.category.type != 'REVENUE') return previousValue;
      return previousValue + element.amount;
    });
  }

  double revenue(int index) {
    final data = state.data[index];
    return data.amount / _revenue;
  }

  double get _expense {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      if (element.category.type != 'EXPENSES') return previousValue;
      return previousValue + element.amount;
    });
  }

  double expense(int index) {
    final data = state.data[index];
    return data.amount / _expense;
  }

  String get total {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      return previousValue + element.amount;
    }).toString();
  }
}
