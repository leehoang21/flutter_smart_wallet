import 'package:equatable/equatable.dart';

import 'package:flutter_smart_wallet/model/category_model.dart';

enum CreateTransactionStatus { initial, loading, succes, failed, noInternet }

class CreateTransactionState extends Equatable {
  final CreateTransactionStatus status;
  final DateTime spendTime;
  final bool buttonIsValid;
  final String? amount;
  final CategoryModel? category;

  CreateTransactionState({
    required this.status,
    required this.spendTime,
    this.buttonIsValid = false,
    this.amount,
    this.category,
  });

  factory CreateTransactionState.initial() => CreateTransactionState(
        status: CreateTransactionStatus.initial,
        spendTime: DateTime.now(),
      );
  @override
  List<Object?> get props => [
        status,
        spendTime,
        buttonIsValid,
        amount,
        category,
      ];

  CreateTransactionState copyWith({
    CreateTransactionStatus? status,
    DateTime? spendTime,
    bool? buttonIsValid,
    String? amount,
    CategoryModel? category,
  }) {
    return CreateTransactionState(
      status: status ?? this.status,
      spendTime: spendTime ?? this.spendTime,
      buttonIsValid: buttonIsValid ?? this.buttonIsValid,
      amount: amount ?? this.amount,
      category: category ?? this.category,
    );
  }
}
