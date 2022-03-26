import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/pick_image_widget.dart';

class Either {
  String? url;
  String? error;
  Either({this.url, this.error});
}

Future<Either?> pickImageFuncion({
  required BuildContext context,
  required Function(BuildContext context) camera,
  required Function(BuildContext context) gallery,
}) async {
  return await showCupertinoModalPopup<Either?>(
    context: context,
    builder: (_) {
      return BlocProvider(
        create: (_) => Injector.getIt.get<PickImageCubit>(),
        child: BlocBuilder<PickImageCubit, PickImageState>(
          builder: (context, state) {
            return PickImageWidget(
              camera: ((context) => camera(context)),
              gallery: ((context) => gallery(context)),
            );
          },
        ),
      );
    },
  );
}
