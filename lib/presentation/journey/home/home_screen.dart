import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/home_constants.dart';
import 'package:flutter_smart_wallet/presentation/widgets/bottom_navigation_bar_widget/bottom_navigation_bar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.black,
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(
          Icons.add_rounded,
          size: 40,
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        iconsData: HomeConstants.bottomIconsData,
        currentIndex: 0,
        onTap: (index) {
          // Switch screen here
        },
      ),
    );
  }
}
