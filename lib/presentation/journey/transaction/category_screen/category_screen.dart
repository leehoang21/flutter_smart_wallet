import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/__mock__/categories_mock.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/category_screen/bloc/category_select_cubit.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/category_screen/category_screens_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/category_screen/widgets/category_tile.dart';
import 'package:flutter_smart_wallet/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CategoryScreen extends StatelessWidget {
  void select(BuildContext context, String category) {
    context.read<CategorySelectCubit>().changeSelectCategory(category);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: CategoryScreenConstants.tabs.length,
      child: Scaffold(
        appBar: AppBarWidget(
          title: translate("transaction_category_screen_categories"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: AppDimens.height_44,
              child: TabBar(
                isScrollable: true,
                tabs: CategoryScreenConstants.tabs.map((title) {
                  return Tab(
                    text: translate(
                        "transaction_category_screen_${title.toLowerCase()}"),
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
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.width_18,
                            ),
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              if (category.subCategories == null ||
                                  category.subCategories!.isEmpty) {
                                return CategoryTile(
                                  categoryModel: category,
                                  isSubCategory: false,
                                  isSelected: category.name! == state,
                                  onTap: (category) =>
                                      select(context, category),
                                );
                              }
                              final subCategories = category.subCategories!;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CategoryTile(
                                    categoryModel: category,
                                    isSubCategory: false,
                                    isSelected: category.name! == state,
                                    onTap: (category) =>
                                        select(context, category),
                                  ),
                                  ...subCategories
                                      .map(
                                        (subCategory) => CategoryTile(
                                          categoryModel: subCategory,
                                          isSubCategory: true,
                                          onTap: (category) =>
                                              select(context, category),
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
