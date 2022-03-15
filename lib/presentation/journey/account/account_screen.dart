import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/account_constants.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key ?? AccountConstants.key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("My Page"),
    );
  }
}
