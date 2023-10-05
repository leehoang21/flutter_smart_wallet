import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/injector/injector.dart';
import 'package:flutter_smart_wallet/common/utils/pick_image_function.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/widget/crop_image.dart';
import 'package:flutter_smart_wallet/presentation/widgets/update_avatar.dart/cubit/update_avatar_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/update_avatar.dart/update_widget_contant.dart';
import 'package:flutter_translate/flutter_translate.dart';

class UpdateAvatar extends StatelessWidget {
  const UpdateAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injector.getIt.get<UpdateAvatarCubit>(),
      child: BlocBuilder<UpdateAvatarCubit, UpdateAvatarState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () async {
              await _pickImage(context);
              await updateAvatar(context);
            },
            child: ClipOval(
              child: AppImageWidget(
                width: AppDimens.space_80,
                path: context.watch<UpdateAvatarCubit>().state.urlAvatar ??
                    ImageConstants.defaultAvatarImg,
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final String _avatarPath =
        context.read<UpdateAvatarCubit>().state.avatarPath;

    final Either? _result = await pickImageFuncion(
        context: context,
        gallery: (context) async {
          await context.read<PickImageCubit>().pickImageFromGallery();
          await cropImage(context);
          await result(context, _avatarPath);
        },
        camera: (context) async {
          await context.read<PickImageCubit>().captureImage();
          await cropImage(context);
          await result(context, _avatarPath);
        });
    if (_result != null) {
      String? _error = _result.error;
      if (_error != null) {
        context.read<SnackbarBloc>().showSnackbar(
              translationKey: _error,
              type: SnackBarType.error,
            );
      }
    }
  }

  Future<void> result(BuildContext context, String avatarPath) async {
    await context.read<PickImageCubit>().upImageStorage(
          avatarPath,
        );
    String? _error = context.read<PickImageCubit>().state.error;
    if (_error != null) {
      Navigator.pop(
        context,
        Either(
          error: translate(_error),
        ),
      );
    }
    Navigator.pop(context);
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
              isCircleUi: true,
              image: _image,
              ctx: context,
              width: 446,
              height: 446,
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

  Future<void> updateAvatar(BuildContext context) async {
    await context.read<UpdateAvatarCubit>().updateAvatar();
    if (context.read<UpdateAvatarCubit>().state is UpdateAvatarSuccess) {
      context.read<SnackbarBloc>().showSnackbar(
            translationKey: translate(UpdateAvatarContant.success),
            type: SnackBarType.success,
          );
    } else {
      context.read<SnackbarBloc>().showSnackbar(
            translationKey: translate(UpdateAvatarContant.failure),
            type: SnackBarType.error,
          );
    }
  }
}
