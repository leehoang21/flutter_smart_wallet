import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/presentation/widgets/bottom_navigation_bar_widget/bottom_navigation_bar_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
    required this.iconsData,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int) onTap;
  final List<Map<String, dynamic>> iconsData;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: iconsData.asMap().entries.map((entry) {
        return BottomNavigationBarItem(
          icon: Padding(
            padding: BottomNavigationBarConstant.itemPadding,
            child: SvgPicture.asset(
              entry.value["iconPath"],
              width: 24.sp,
              color: entry.key == currentIndex
                  ? AppColor.ebonyClay
                  : AppColor.grey,
              height: 18,
            ),
          ),
          label: entry.value["label"],
        );
      }).toList(),
      selectedFontSize: BottomNavigationBarConstant.labelFontSize,
      unselectedFontSize: BottomNavigationBarConstant.labelFontSize,
    );
  }
}
