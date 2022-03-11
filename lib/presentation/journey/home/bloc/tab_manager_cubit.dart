import 'package:flutter_bloc/flutter_bloc.dart';

class TabMangerCubit extends Cubit<int> {
  TabMangerCubit() : super(0);

  void changePage(int index) {
    emit(index);
  }
}
