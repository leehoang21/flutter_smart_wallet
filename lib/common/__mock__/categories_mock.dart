import 'package:flutter_smart_wallet/model/category_model.dart';

class MockData {
  static List<CategoryModel> categoriesData = [
    CategoryModel(
      name: 'EATING',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          name: 'COFFEE',
        ),
        CategoryModel(
          name: 'DRINKING',
        ),
        CategoryModel(
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
          name: 'MAINTENANCE',
        ),
        CategoryModel(
          name: 'PARKING',
        ),
        CategoryModel(
          name: 'TAXI',
        ),
        CategoryModel(
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
          name: 'CLOTHES',
        ),
        CategoryModel(
          name: 'ACCESSORY',
        ),
        CategoryModel(
          name: 'ELECTRONIC_DEVICE',
        ),
      ],
    ),
    CategoryModel(
      name: 'DONATE',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          name: 'WEDDING',
        ),
        CategoryModel(
          name: 'FUNERAL',
        ),
        CategoryModel(
          name: 'CHARITY',
        ),
      ],
    ),
    CategoryModel(
      name: 'BILLS_AND_UTILITIES',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          name: 'ELECTRIC_BILL',
        ),
        CategoryModel(
          name: 'RENT_HOUSE',
        ),
        CategoryModel(
          name: 'TV_BILL',
        ),
        CategoryModel(
          name: 'GAS_BILL',
        ),
        CategoryModel(
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
          name: 'BOOK',
        ),
        CategoryModel(
          name: 'COURSE',
        ),
      ],
    ),
    CategoryModel(
      name: 'HEALTH',
      type: 'EXPENSES',
      subCategories: [
        CategoryModel(
          name: 'PERSONAL_HYGIENE',
        ),
        CategoryModel(
          name: 'HEALTHCARE',
        ),
        CategoryModel(
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
