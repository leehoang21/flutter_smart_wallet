import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/goal/goal_screen_constants.dart';

class GoalScreen extends StatelessWidget {
  GoalScreen({Key? key}) : super(key: key ?? GoalScreenConstants.key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Goal',
      ),
    );
  }
}
