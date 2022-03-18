import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/__mock__/categories_mock.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/category_screen/bloc/category_select_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/category_screen/category_screens_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/category_screen/widgets/category_tile.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_smart_wallet/common/extensions/string_extension.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: CategoryScreenConstants.tabs.length,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Categories',
          leading: GestureDetector(
            child: SvgPicture.asset(
              "assets/icons/help.svg",
              color: AppColor.ebonyClay,
              width: CategoryScreenConstants.appBarLeadingIconSize,
            ),
            onTap: () {
              // TODO: show help dialog
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: CategoryScreenConstants.tabBarHeight,
              child: TabBar(
                isScrollable: true,
                tabs: CategoryScreenConstants.tabs.map((title) {
                  return Tab(
                    text: title.replaceAll("_", " ").toTitleCase,
                  );
                }).toList(),
                indicatorColor: AppColor.ebonyClay,
              ),
            ),
            Expanded(
              child: BlocBuilder<CategorySelectCubit, String>(
                builder: (context, state) {
                  return SafeArea(
                    child: TabBarView(
                      children: CategoryScreenConstants.tabs.map(
                        (title) {
                          final categories = MockData.categoriesData
                              .where((element) => element.type! == title)
                              .toList();
                          return ListView.builder(
                            padding:
                                CategoryScreenConstants.categoryListViewPadding,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              if (category.subCategories == null ||
                                  category.subCategories!.isEmpty) {
                                return CategoryTile(
                                  categoryModel: category,
                                  isSubCategory: false,
                                  isSelected: category.name! == state,
                                  onTap: context
                                      .read<CategorySelectCubit>()
                                      .changeSelectCategory,
                                );
                              }
                              final subCategories = category.subCategories!;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CategoryTile(
                                      categoryModel: category,
                                      isSubCategory: false),
                                  ...subCategories
                                      .map(
                                        (subCategory) => CategoryTile(
                                          categoryModel: subCategory,
                                          isSubCategory: true,
                                          onTap: context
                                              .read<CategorySelectCubit>()
                                              .changeSelectCategory,
                                          isSelected:
                                              subCategory.name! == state,
                                        ),
                                      )
                                      .toList(),
                                ],
                              );
                            },
                            itemCount: categories.length,
                          );
                        },
                      ).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: add custom category
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
