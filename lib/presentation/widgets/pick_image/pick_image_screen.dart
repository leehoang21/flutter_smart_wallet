import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/utils/pick_image_function.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/pick_image_screen_constant.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/widget/crop_image.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/widget/title_action.dart';
import 'package:flutter_translate/flutter_translate.dart';

class PickImageScreen extends StatelessWidget {
  const PickImageScreen({
    required this.withCircleUi,
    Key? key,
    required this.imagePathStorage,
    required this.width,
    required this.height,
  }) : super(key: key);
  final String imagePathStorage;
  final double width;
  final double height;
  final bool withCircleUi;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context, null);
        },
        child: TitleAction(
          text: PickImageScreenConstant.cancel,
        ),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () async {
            await context.read<PickImageCubit>().pickImageFromGallery();
            await cropImage(context);
            await resultUrl(context);
          },
          child: TitleAction(
            text: PickImageScreenConstant.gallery,
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () async {
            await context.read<PickImageCubit>().captureImage();
            await cropImage(context);
            await resultUrl(context);
          },
          child: TitleAction(
            text: PickImageScreenConstant.camera,
          ),
        ),
      ],
    );
  }

  Future<void> resultUrl(BuildContext context) async {
    await context.read<PickImageCubit>().upAndDownImage(
          imagePathStorage,
        );
    String? _error = context.read<PickImageCubit>().state.error;
    if (_error != null) {
      Navigator.pop(
        context,
        Either(
          error: translate(_error),
        ),
      );
    } else {
      Navigator.pop(
        context,
        Either(
          url: context.read<PickImageCubit>().state.url,
        ),
      );
    }
  }

  Future<void> cropImage(BuildContext context) async {
    if (context.read<PickImageCubit>().state is ResultImage) {
      Uint8List? _image = context.read<PickImageCubit>().state.image;
      String? _error = context.read<PickImageCubit>().state.error;
      if (_image != null) {
        await Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => CropImage(
              withCircleUi: withCircleUi,
              image: _image,
              ctx: context,
              width: width,
              height: height,
            ),
          ),
        );
      }
      if (_error != null) {
        Navigator.pop(
          context,
          Either(
            error: translate(_error),
          ),
        );
      }
    }
  }
}
