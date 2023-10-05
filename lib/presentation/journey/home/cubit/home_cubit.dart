import 'package:equatable/equatable.dart';
import 'package:flutter_smart_wallet/common/extensions/translate_extension.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/common/utils/format_utils.dart';
import 'package:flutter_smart_wallet/model/transaction_model.dart';
import 'package:flutter_smart_wallet/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:flutter_smart_wallet/use_case/transaction_use_case.dart';
import 'package:flutter_smart_wallet/use_case/user_use_case.dart';

part 'home_state.dart';

class HomeCubit extends BaseBloc<HomeState> {
  HomeCubit(this.useCase, this.userUseCase) : super(HomeState());
  final TransactionUseCase useCase;
  final UserUseCase userUseCase;
  DateTime date = DateTime.now();

  @override
  Future onConnected() async {
    await getData();
    super.onConnected();
  }

  changeDate(DateTime time) {
    date = time;
  }

  Future getData() async {
    try {
      final uid = await userUseCase.getUid();
      final result = await useCase.getTransaction(uid);
      emit(state.copyWith(data: result, status: HomeStateStatus.loaded));
    } catch (e) {
      logger(e.toString());
      emit(state.copyWith(status: HomeStateStatus.error));
    }
  }

  String get revenue {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      final dateItem = DateTime.fromMillisecondsSinceEpoch(element.spendTime);
      if (dateItem.month != date.month || dateItem.year != date.year)
        return previousValue;
      if (element.category.type != 'REVENUE') return previousValue;
      return previousValue + element.amount;
    }).toString();
  }

  String get expense {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      final dateItem = DateTime.fromMillisecondsSinceEpoch(element.spendTime);
      if (dateItem.month != date.month || dateItem.year != date.year)
        return previousValue;
      if (element.category.type != 'EXPENSES') return previousValue;
      return previousValue + element.amount;
    }).toString();
  }

  Map<String, List<TransactionModel>> data(bool isMonth) {
    isMonth = !isMonth;

    List<TransactionModel> data = state.data.map((e) => e.copyWith()).toList();
    data.sort((a, b) => b.spendTime.compareTo(a.spendTime));
    Map<String, List<TransactionModel>> result = {};
    for (final item in data) {
      final dateItem = DateTime.fromMillisecondsSinceEpoch(item.spendTime);
      if (isMonth) {
        if (dateItem.month == date.month && dateItem.year == date.year) {
          if (dateItem.day == date.day) {
            result['Today'.tr] = [...result['Today'.tr] ?? [], item];
          } else if (dateItem.day == date.day - 1) {
            result['Yesterday'.tr] = [...result['Yesterday'.tr] ?? [], item];
          } else {
            final timeString = formatDateMonth(
                DateTime.fromMillisecondsSinceEpoch(item.spendTime));
            result[timeString] = [...result[timeString] ?? [], item];
          }
        }
      } else if (dateItem.day == date.day &&
          dateItem.month == date.month &&
          dateItem.year == date.year) {
        result['Today'.tr] = [...result['Today'.tr] ?? [], item];
      } else if (dateItem.day == date.day - 1 &&
          dateItem.month == date.month &&
          dateItem.year == date.year) {
        result['Yesterday'.tr] = [...result['Yesterday'.tr] ?? [], item];
      } else {
        final timeString = formatDateMonth(
            DateTime.fromMillisecondsSinceEpoch(item.spendTime));
        result[timeString] = [...result[timeString] ?? [], item];
      }
    }
    return result;
  }

  double get total {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      final dateItem = DateTime.fromMillisecondsSinceEpoch(element.spendTime);
      if (dateItem.month != date.month || dateItem.year != date.year)
        return previousValue;
      if (element.category.type != 'EXPENSES')
        return previousValue + element.amount;
      return previousValue - element.amount;
    });
  }
}
