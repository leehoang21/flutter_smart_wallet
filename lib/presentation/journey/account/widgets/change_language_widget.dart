import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/constants/route_list.dart';
import 'package:flutter_smart_wallet/common/extensions/translate_extension.dart';
import 'package:flutter_translate/flutter_translate.dart';

class ChangeLanguegeWidget extends StatefulWidget {
  const ChangeLanguegeWidget({super.key});

  @override
  State<ChangeLanguegeWidget> createState() => _ChangeLanguegeWidgetState();
}

class _ChangeLanguegeWidgetState extends State<ChangeLanguegeWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: LocalizedApp.of(context).delegate.currentLocale.languageCode,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24.w,
      elevation: 20,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? newValue) {
        if (newValue != null) {
          changeLocale(context, newValue);
        }

        Navigator.pushNamedAndRemoveUntil(
            context, RouteList.splashScreen, (route) => false);
      },
      focusColor: Colors.deepPurple,
      borderRadius: BorderRadius.circular(10.r),
      underline: SizedBox(),
      items: <String>['en', 'vi'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value.tr),
        );
      }).toList(),
    );
  }
}
