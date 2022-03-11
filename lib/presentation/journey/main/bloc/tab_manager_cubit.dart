import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabMangerState extends Equatable {
  final int currentPage;

  const TabMangerState(this.currentPage);
  @override
  List<Object?> get props => [currentPage];
}

class TabMangerCubit extends Cubit<TabMangerState> {
  TabMangerCubit() : super(TabMangerState(0));

  void changePage(int index) {
    emit(TabMangerState(index));
  }
}
