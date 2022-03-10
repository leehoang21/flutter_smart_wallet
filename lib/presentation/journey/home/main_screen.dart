import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/bloc/tab_manager_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/main_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/widgets/bottom_navigation_bar_widget/bottom_navigation_bar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabMangerCubit(),
      child: Scaffold(
        body: _BuildBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox.square(
          dimension: MainConstants.floatingActionButtonDimension,
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
        bottomNavigationBar: _BuildBottomNavigationBar(),
      ),
    );
  }
}

class _BuildBottomNavigationBar extends StatelessWidget {
  const _BuildBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabMangerCubit, TabMangerState>(
      builder: (context, state) {
        return BottomNavigationBarWidget(
          currentIndex: state.currentPage,
          onTap: context.read<TabMangerCubit>().changePage,
          iconsData: MainConstants.bottomIconsData,
        );
      },
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabMangerCubit, TabMangerState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: MainConstants.screenAnimatingDuration,
          child: MainConstants.screens[state.currentPage],
        );
      },
    );
  }
}
