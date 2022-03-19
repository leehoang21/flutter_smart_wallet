import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/pick_image_screen_constant.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/widget/alert_dialog_error.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/widget/crop_image.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/widget/title_action.dart';

class PickImageScreen extends StatelessWidget {
  const PickImageScreen({
    required this.withCircleUi,
    Key? key,
    required this.imagePathStorage,
    required this.initialArea,
  }) : super(key: key);
  final String imagePathStorage;
  final Rect initialArea;
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
    if (context.read<PickImageCubit>().state is PickImageError) {
      await showCupertinoDialog(
        context: context,
        builder: (_) => AlertDialogError(
          ctx: context,
        ),
      );
      Navigator.pop(context, null);
    } else {
      Navigator.pop(
        context,
        context.read<PickImageCubit>().state.url,
      );
    }
  }

  Future<void> cropImage(BuildContext context) async {
    if (context.read<PickImageCubit>().state is ResultImage) {
      Uint8List? _image = context.read<PickImageCubit>().state.image;
      if (_image != null) {
        await Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => CropImage(
              withCircleUi: withCircleUi,
              image: _image,
              ctx: context,
              initialArea: initialArea,
            ),
          ),
        );
      }
    } else {
      await showCupertinoDialog(
        context: context,
        builder: (_) => AlertDialogError(
          ctx: context,
        ),
      );
      Navigator.pop(context, null);
    }
  }
}
