import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/argument_constants.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/utils/app_utils.dart';
import 'package:flutter_smart_wallet/common/utils/formatter/mask_input_formatter.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_smart_wallet/presentation/journey/login/widget/circle_icon_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'login_constants.dart';
import 'widget/devider_text_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: LoginConstants.topHeightLogo),
              child: Image.asset(
                ImageConstants.logoSplashImg,
                height: LoginConstants.sizeLogo,
                width: LoginConstants.sizeLogo,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: LoginConstants.horizontalScreen)
                  .copyWith(top: LoginConstants.topColumn),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LoginConstants.login,
                    style: ThemeText.style18Bold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: LoginConstants.distanceTextToField),
                    child: TextFieldWidget(
                      inputFormatter: [MaskedInputFormatter('#### ### ###')],
                      controller: controller,
                      keyboardType: TextInputType.phone,
                      hintText: LoginConstants.yourPhone,
                      textStyle: ThemeText.style14Medium
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: LoginConstants.distanceButtonToField,
                    ),
                    child: TextButtonWidget(
                      onPressed: () async {
                        final currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus &&
                            currentFocus.focusedChild != null) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        }

                        final phoneNumberFormat =
                            controller.text.replaceFirst(RegExp('0'), '+84');

                        dynamic _error = await Navigator.pushNamed(
                          context,
                          RouteList.verifyOtpScreen,
                          arguments: {
                            ArgumentConstants.phoneNumber: phoneNumberFormat,
                          },
                        );
                        if (!isNullEmpty(_error) && _error is String) {
                          context.read<SnackbarBloc>().showSnackbar(
                                translationKey: _error,
                                type: SnackBarType.error,
                              );
                        }
                      },
                      title: LoginConstants.signIn,
                    ),
                  ),
                  const DeviderTextWidget(),
                  SizedBox(
                    height: LoginConstants.distanceButtonToField,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      IconConstants.listIconsLogin.length,
                      (index) => CircleIconWidget(
                        iconSvg: IconConstants.listIconsLogin[index],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
