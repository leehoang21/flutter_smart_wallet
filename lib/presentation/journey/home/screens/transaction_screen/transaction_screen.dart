import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/screens/transaction_screen/transaction_screen_constants.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key? key})
      : super(key: key ?? TransactionScreenConstants.key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Transaction',
      ),
    );
  }
}
