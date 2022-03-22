import 'package:flutter_smart_wallet/model/category_model.dart';

class MockData {
  static List<CategoryModel> categoriesData = [
    CategoryModel(
      name: 'EATING',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          name: 'COFFEE',
          type: 'EXPENSES',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'DRINKING',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'RESTAURANT',
        ),
      ],
    ),
    CategoryModel(
      name: 'FRIEND_AND_LOVER',
      type: 'EXPENSES',
    ),
    CategoryModel(
      name: 'MOVE',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'MAINTENANCE',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'PARKING',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'TAXI',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'OIL',
        ),
      ],
    ),
    CategoryModel(
      name: 'FAMILY',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          name: 'CHILDREN',
          type: 'EXPENSES',
        ),
        CategoryModel(
          name: 'HOME_REPAIR',
          type: 'EXPENSES',
        ),
        CategoryModel(
          name: 'HOME_SERVICE',
          type: 'EXPENSES',
        ),
        CategoryModel(
          name: 'PETS',
          type: 'EXPENSES',
        ),
      ],
    ),
    CategoryModel(
      name: 'TRAVELING',
      type: 'EXPENSES',
    ),
    CategoryModel(
      name: 'SHOPPING',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'CLOTHES',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'ACCESSORY',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'ELECTRONIC_DEVICE',
        ),
      ],
    ),
    CategoryModel(
      name: 'DONATE',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'WEDDING',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'FUNERAL',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'CHARITY',
        ),
      ],
    ),
    CategoryModel(
      name: 'BILLS_AND_UTILITIES',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'ELECTRIC_BILL',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'RENT_HOUSE',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'TV_BILL',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'GAS_BILL',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'WATER_BILL',
        ),
      ],
    ),
    CategoryModel(
      name: 'INVESTMENT',
      type: 'EXPENSES',
    ),
    CategoryModel(
      name: 'OTHER',
      type: 'EXPENSES',
    ),
    CategoryModel(
      name: 'EDUCATION',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'BOOK',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'COURSE',
        ),
      ],
    ),
    CategoryModel(
      name: 'HEALTH',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          type: 'EXPENSES',
          name: 'PERSONAL_HYGIENE',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'HEALTHCARE',
        ),
        CategoryModel(
          type: 'EXPENSES',
          name: 'MEDICINE',
        ),
      ],
    ),
    CategoryModel(
      name: 'BUSINESS',
      type: 'EXPENSES',
    ),
    CategoryModel(
      name: 'SELL_THINGS',
      type: 'REVENUE',
    ),
    CategoryModel(
      name: 'SALARY',
      type: 'REVENUE',
    ),
    CategoryModel(
      name: 'BONUS',
      type: 'REVENUE',
    ),
    CategoryModel(
      name: 'LIVING_EXPENSE',
      type: 'REVENUE',
    ),
    CategoryModel(
      name: 'AWARDED',
      type: 'REVENUE',
    ),
    CategoryModel(
      name: 'OTHER',
      type: 'REVENUE',
    ),
    CategoryModel(
      name: 'DEBT_COLLECTION',
      type: 'DEBTS_AND_LOAN',
    ),
    CategoryModel(
      name: 'BORROW',
      type: 'DEBTS_AND_LOAN',
    ),
    CategoryModel(
      name: 'LOAN',
      type: 'DEBTS_AND_LOAN',
    ),
    CategoryModel(
      name: 'PAY',
      type: 'DEBTS_AND_LOAN',
    ),
  ];
}
