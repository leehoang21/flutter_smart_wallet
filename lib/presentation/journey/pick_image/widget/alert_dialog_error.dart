import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/pick_image/cubit/pick_image_cubit.dart';

class AlertDialogError extends StatelessWidget {
  const AlertDialogError({
    Key? key,
    required this.ctx,
  }) : super(key: key);
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        ctx.read<PickImageCubit>().state.error.toString(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('ok'),
        ),
      ],
    );
  }
}
