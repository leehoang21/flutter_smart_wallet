import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/presentation/journey/authentication/register/controller/register_controller.dart';
import 'package:flutter_smart_wallet/presentation/journey/authentication/register/register_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/authentication/register/widget/reigister_form.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  final String phone;

  const RegisterScreen({Key? key,required this.phone}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();

  final _mailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  final _registerController = Get.find<RegisterController>();

  @override
  void initState() {
    _phoneController.text = widget.phone;
    _registerController.registerSuccess.listen((value) {
      if (value){
        Get.offNamedUntil(RouteList.mainScreen, (route) => false);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
        leading: AppBarButton(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColor.black,
            size: RegisterConstants.sizeBoxHeight18,
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: RegisterConstants.paddingTop,
                left: LayoutConstants.paddingHorizontalApp,
                right: LayoutConstants.paddingHorizontalApp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  RegisterConstants.signUpAnd,
                  style: ThemeText.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                Text(
                  RegisterConstants.starting,
                  style: ThemeText.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(
                  height: RegisterConstants.sizeBoxHeight75,
                ),
                Form(
                  key: _registerFormKey,
                  child: RegisterForm(
                      nameController: _nameController,
                      mailController: _mailController,
                      phoneController: _phoneController,
                  register: _register,),
                ),
                SizedBox(
                  height: RegisterConstants.sizeBoxHeight46,
                ),
                InkWell(
                  onTap: _login,
                  child: Text(
                    RegisterConstants.signIn,
                    style: ThemeText.caption.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: AppColor.black),
                  ),
                ),
                SizedBox(
                  height: RegisterConstants.sizeBoxHeight46,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    Get.offNamedUntil(RouteList.loginScreen, (route) => false);
  }

  void _register(){
    if (_registerFormKey.currentState!.validate()){
      _registerController.createAccount(_nameController.text,_mailController.text, _phoneController.text);
    }
  }
}
