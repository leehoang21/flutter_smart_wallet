import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/model/category_model.dart';

class CategorySelectCubit extends Cubit<CategoryModel?> {
  CategorySelectCubit() : super(null);

  void changeSelectCategory(CategoryModel? category) {
    emit(category);
  }
}
