import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/common/extensions/string_extension.dart';
import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/category_screen/widgets/category_tile_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_svg/svg.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.categoryModel,
    required this.isSubCategory,
    this.isSelected = false,
    this.onTap,
  })  : assert(isSubCategory == false || onTap != null),
        super(key: key);

  final void Function(String)? onTap;
  final bool isSubCategory;
  final CategoryModel categoryModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final convertedText = categoryModel.name!.replaceAll("_", " ").toTitleCase;
    final imagePath =
        "assets/images/2.0x/categories/${categoryModel.name!.toLowerCase()}.png";
    return InkWell(
      enableFeedback: isSubCategory,
      onTap: () {
        onTap!(categoryModel.name!);
      },
      child: Container(
        height: CategoryTileConstants.tileHeight,
        child: Row(
          children: [
            if (isSubCategory)
              SizedBox(width: CategoryTileConstants.subTileIndent),
            SizedBox.square(
              dimension: isSubCategory
                  ? CategoryTileConstants.subTileIconSize
                  : CategoryTileConstants.tileIconSize,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 8.sp,
            ),
            Text(
              convertedText,
              style: TextStyle(
                  fontSize: CategoryTileConstants.tileFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColor.ebonyClay),
            ),
            Spacer(),
            if (isSelected)
              SizedBox.square(
                dimension: CategoryTileConstants.checkIconSize,
                child: SvgPicture.asset(
                  CategoryTileConstants.checkIconPath,
                ),
              )
          ],
        ),
      ),
    );
  }
}
