import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/utils/pick_image_function.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/cubit/register_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController =
      TextEditingController(text: '0966 976 259');
  final TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String _id = context.read<RegisterCubit>().state.id;
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Register',
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () async {
                String? _url = await pickImageFuncion(
                  context,
                  '$_id/avatar',
                );
                context.read<RegisterCubit>().addUrl(_url);
              },
              child: AppImageWidget(
                path: context
                        .watch<RegisterCubit>()
                        .state
                        .userInfomationModel
                        .avatar ??
                    ImageConstants.defaultAvatarImg,
              ),
            ),
            TextFieldWidget(
              controller: _phoneController,
            ),
            TextFieldWidget(
              controller: _userNameController,
              hintText: 'User Name',
            ),
            TextFieldWidget(
              controller: _emailController,
              hintText: 'Email',
            ),
            TextButtonWidget(onPressed: () {}, title: 'Register'),
          ],
        ),
      ),
    );
  }
}
