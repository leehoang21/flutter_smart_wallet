import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/cubit/verify_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/verify_otp_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/verify_otp/widget/otp_widget.dart';
import 'package:flutter_smart_wallet/presentation/widgets/loading_widget/loader_widget.dart';
import 'package:flutter_translate/flutter_translate.dart';

class VerifyOtpScreen extends StatefulWidget {
  VerifyOtpScreen({Key? key, this.phoneNumber}) : super(key: key);
  final String? phoneNumber;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState(phoneNumber);
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final String? phoneNumber;

  _VerifyOtpScreenState(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyCubit, VerifyState>(
      listener: (context, state) {
        if (state is VerifySuccess) {
          if (state.isUserFirestore) {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteList.mainScreen, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteList.registerScreen, (route) => false);
          }
        } else if (state is VerifyFailure) {
          verifyFailure(state, context);
        }
      },
      child: Scaffold(
        body: BlocBuilder<VerifyCubit, VerifyState>(
          builder: (context, state) {
            if (state is VerifyLoading) {
              return Center(
                child: LoaderWidget(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    context.watch<VerifyCubit>().state.timeResend,
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: VerifyOtpConstants.topHeightLogo),
                    child: Image.asset(
                      ImageConstants.logoSplashImg,
                      height: VerifyOtpConstants.sizeLogo,
                      width: VerifyOtpConstants.sizeLogo,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: VerifyOtpConstants.horizontalScreen,
                    ).copyWith(
                      top: VerifyOtpConstants.topColumn,
                    ),
                    child: OtpWidget(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void verifyFailure(VerifyFailure state, BuildContext context) {
    if (state.error == VerifyOtpConstants.invalidOtp) {
      context.read<SnackbarBloc>().showSnackbar(
            translationKey: translate(state.error),
            type: SnackBarType.error,
          );
    } else {
      Navigator.pop(context, state.error);
    }
  }

  @override
  void initState() {
    context.read<VerifyCubit>().addPhoneNumber(phoneNumber);
    context.read<VerifyCubit>().verifyPhonenumber();
    super.initState();
  }
}
