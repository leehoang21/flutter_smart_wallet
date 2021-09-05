import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/register/register_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController mailController;
  final TextEditingController phoneController;

  const RegisterForm(
      {Key? key,
      required this.nameController,
      required this.mailController,
      required this.phoneController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          controller: nameController,
          hintText: RegisterConstants.name,
        ),
        SizedBox(
          height: RegisterConstants.sizeBoxHeight18,
        ),
        TextFieldWidget(
          controller: mailController,
          hintText: RegisterConstants.emailAddress,
        ),
        SizedBox(
          height: RegisterConstants.sizeBoxHeight18,
        ),
        TextFieldWidget(
          controller: phoneController,
          hintText: RegisterConstants.phone,
        ),
      ],
    );
  }
}
