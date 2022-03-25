import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelectCubit extends Cubit<String> {
  CategorySelectCubit() : super("EATING");

  void changeSelectCategory(String category) {
    emit(category);
  }
}
