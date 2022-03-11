import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_smart_wallet/presentation/journey/home/bloc/tab_manager_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TabMangerCubit test: ', () {
    late TabMangerCubit tabMangerCubit;

    setUp(() {
      tabMangerCubit = TabMangerCubit();
    });

    test('Initial state is 0', () {
      expect(tabMangerCubit.state, 0);
    });

    blocTest<TabMangerCubit, int>(
      'Emits [MyState] when MyEvent is added.',
      build: () => tabMangerCubit,
      act: (bloc) => bloc.changePage(1),
      expect: () => const <int>[1],
    );
  });
}
