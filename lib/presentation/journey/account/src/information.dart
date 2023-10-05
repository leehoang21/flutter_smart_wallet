import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'avata.dart';
import 'cardinfor.dart';

class Information extends StatelessWidget {
  Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Avata(),
          SizedBox(
            width: 10.w,
          ),
          CardInfor(),
        ],
      ),
    );
  }
}
