import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/enums/snackbar_enum.dart';
import 'package:flutter_smart_wallet/common/utils/pick_image_function.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/cubit/register_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/register_screen_contant.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/widget/back_ground_register.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_translate/flutter_translate.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String _id = context.read<RegisterCubit>().state.id;
    return BackgroundRegister(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: AppDimens.space_80,
                    height: AppDimens.space_80,
                    child: GestureDetector(
                      onTap: () async {
                        final Either? _result = await pickImageFuncion(
                          context,
                          '$_id/avatar.png',
                        );
                        if (_result != null) {
                          String? _error = _result.error;
                          if (_error != null) {
                            context.read<SnackbarBloc>().showSnackbar(
                                  translationKey: _error,
                                  type: SnackBarType.error,
                                );
                          }
                          if (_result.url != null) {
                            context.read<RegisterCubit>().addUrl(
                                  _result.url,
                                );
                          }
                        }
                      },
                      child: ClipOval(
                        child: AppImageWidget(
                          path: context
                                  .watch<RegisterCubit>()
                                  .state
                                  .userModel
                                  .avatar ??
                              ImageConstants.defaultAvatarImg,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.height_32,
                  ),
                  TextFieldWidget(
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
                      await context.read<RegisterCubit>().register(
                            email: _emailController.text,
                            userName: _userNameController.text,
                          );
                      String? _error =
                          context.read<RegisterCubit>().state.errorMessage;
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
}
