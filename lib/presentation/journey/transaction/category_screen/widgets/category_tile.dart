import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/icon_constants.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/model/category_model.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.categoryModel,
    required this.isSubCategory,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final void Function(String) onTap;
  final bool isSubCategory;
  final CategoryModel categoryModel;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final imagePath =
        "${ImageConstants.twoX}/${categoryModel.name!.toLowerCase()}.png";
    return InkWell(
      onTap: () {
        onTap(categoryModel.name!);
      },
      child: Container(
        height: AppDimens.height_44,
        child: Row(
          children: [
            if (isSubCategory)
              SizedBox(
                width: AppDimens.space_18,
              ),
            SizedBox.square(
              dimension:
                  isSubCategory ? AppDimens.space_26 : AppDimens.space_36,
              child: AppImageWidget(
                path: imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: AppDimens.width_8,
            ),
            Text(
              translate(
                  "transaction_category_screen_${categoryModel.name!.toLowerCase()}"),
              style: TextStyle(
                  fontSize: AppDimens.space_14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.ebonyClay),
            ),
            Spacer(),
            if (isSelected)
              SizedBox.square(
                dimension: AppDimens.width_18,
                child: AppImageWidget(
                  path: IconConstants.check,
                ),
              )
          ],
        ),
      ),
    );
  }
}
