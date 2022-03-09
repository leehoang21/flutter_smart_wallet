import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/home_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/bottom_navigation_bar_widget/bottom_navigation_bar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: HomeConstants.pages[_currentPage],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox.square(
        dimension: 56.sp,
        child: FloatingActionButton(
          backgroundColor: AppColor.black,
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: Icon(
            Icons.add_rounded,
            size: 52.sp,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        iconsData: HomeConstants.bottomIconsData,
      ),
    );
  }
}
