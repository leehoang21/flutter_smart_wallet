import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/account_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/src/categories.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/src/information.dart';
import 'package:flutter_smart_wallet/presentation/journey/account/src/version.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key ?? AccountConstants.key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Page",
          style: TextStyle(fontSize: 23, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Information(),
            flex: 1,
          ),
          Expanded(
            child: Categories(),
            flex: 2,
          ),
          Expanded(
            child: version(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
