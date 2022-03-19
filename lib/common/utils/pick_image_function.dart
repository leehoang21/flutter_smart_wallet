import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/utils/compress.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/pick_image_screen.dart';
import 'package:flutter_smart_wallet/repository/local/pick_image_local_repository.dart';
import 'package:flutter_smart_wallet/repository/remote/up_and_down_storage_remote_repository.dart';
import 'package:flutter_smart_wallet/use_case/pick_image_use_case.dart';

Future<String?> pickImageFuncion(
  BuildContext context,
  String imagePathStorage, {
  Rect initialArea = const Rect.fromLTWH(0, 0, 446, 792),
  bool withCircleUi = true,
}) async {
  return await showCupertinoModalPopup<String?>(
    context: context,
    builder: (_) {
      return BlocProvider(
        create: (_) => PickImageCubit(
          PickImageUseCase(
            compress: Compress(),
            localRepository: PickImageLocalRepository(),
            remoteRepository: UpDownStorageRemoteRepository(),
            imagePathStorage: imagePathStorage,
          ),
        ),
        child: PickImageScreen(
          withCircleUi: withCircleUi,
          imagePathStorage: imagePathStorage,
          initialArea: initialArea,
        ),
      );
    },
  );
}
