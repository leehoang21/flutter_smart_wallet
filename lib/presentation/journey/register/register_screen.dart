import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/utils/pick_image_function.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/cubit/register_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/register_screen_contant.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/widget/back_ground_register.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/widget/crop_image.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_translate/flutter_translate.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;

  late final TextEditingController _userNameController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundRegister(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await _pickImage(context);
                    },
                    child: SizedBox(
                      width: AppDimens.space_80,
                      child: ClipOval(
                        child:
                            context.watch<RegisterCubit>().state.avatar != null
                                ? Image.memory(
                                    context.read<RegisterCubit>().state.avatar!,
                                  )
                                : AppImageWidget(
                                    path: ImageConstants.defaultAvatarImg,
                                  ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.height_32,
                  ),
                  TextFieldWidget(
                    enabled: false,
                    controller: TextEditingController(
                        text: context
                            .read<RegisterCubit>()
                            .state
                            .userModel
                            .phoneNumber),
                  ),
                  SizedBox(
                    height: AppDimens.height_12,
                  ),
                  TextFieldWidget(
                    controller: _userNameController,
                    hintText: RegisterScreenContant.hintUserName,
                  ),
                  SizedBox(
                    height: AppDimens.height_12,
                  ),
                  TextFieldWidget(
                    controller: _emailController,
                    hintText: RegisterScreenContant.hintEmail,
                  ),
                  SizedBox(
                    height: AppDimens.height_16,
                  ),
                  TextButtonWidget(
                    onPressed: () async {
                      await registerOnPressed(context);
                    },
                    title: RegisterScreenContant.title,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Future<void> registerOnPressed(BuildContext context) async {
    await context.read<RegisterCubit>().register(
          email: _emailController.text,
          userName: _userNameController.text,
        );
    String? _error = context.read<RegisterCubit>().state.errorMessage;
    if (_error != null) {
      context.read<SnackbarBloc>().showSnackbar(
            translationKey: translate(_error),
            type: SnackBarType.error,
          );
    } else {
      await Navigator.pushNamed(
        context,
        RouteList.mainScreen,
      );
    }
  }

  Future<void> _pickImage(BuildContext context) async {
    final Either? _result = await pickImageFuncion(
        context: context,
        gallery: (context) async {
          await context.read<PickImageCubit>().pickImageFromGallery();
          await cropImage(context);
          result(context);
        },
        camera: (context) async {
          await context.read<PickImageCubit>().captureImage();
          await cropImage(context);
          result(context);
        });
    if (_result != null) {
      String? _error = _result.error;
      if (_error != null) {
        context.read<SnackbarBloc>().showSnackbar(
              translationKey: _error,
              type: SnackBarType.error,
            );
      }
      if (_result.image != null) {
        context.read<RegisterCubit>().addAvatar(
              _result.image!,
            );
      }
    }
  }

  void result(BuildContext context) {
    Uint8List? _image = context.read<PickImageCubit>().state.image;
    String? _error = context.read<PickImageCubit>().state.error;

    if (_image != null) {
      Navigator.pop(
        context,
        Either(image: _image),
      );
    }
    if (_error != null) {
      Navigator.pop(
        context,
        Either(error: _error),
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
              isCircleUi: true,
              image: _image,
              ctx: context,
              width: 446,
              height: 446,
            ),
          ),
        );
      }
      String? _error = context.read<PickImageCubit>().state.error;
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
