import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/utils/compress.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/pick_image_screen.dart';
import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';

class Either {
  String? url;
  String? error;
  Either({this.url, this.error});
}

Future<Either?> pickImageFuncion(
  BuildContext context,
  String imagePathStorage, {
  double width = 446,
  double height = 792,
  bool withCircleUi = true,
}) async {
  return await showCupertinoModalPopup<Either?>(
    context: context,
    builder: (_) {
      return BlocProvider(
        create: (_) => PickImageCubit(
          PickImageUseCase(
            localRepository: PickImageLocalRepository(),
            remoteRepository: UpDownStorageRemoteRepository(),
          ),
        ),
        child: PickImageScreen(
          withCircleUi: withCircleUi,
          imagePathStorage: imagePathStorage,
          width: width,
          height: height,
        ),
      );
    },
  );
}
