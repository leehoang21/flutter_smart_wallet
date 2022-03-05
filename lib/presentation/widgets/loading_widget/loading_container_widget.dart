import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter_smart_wallet/presentation/bloc/loading_bloc/loading_state.dart';
import 'package:flutter_smart_wallet/presentation/widgets/loading_widget/loader_widget.dart';

class LoadingContainerWidget extends StatelessWidget {
  final Widget child;

  const LoadingContainerWidget({Key? key, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        BlocBuilder<LoadingBloc, LoadingState>(
          builder: (context, state) {
            return Visibility(
              visible: state.status == LoadingStatus.loading,
              child: Center(
                child: LoaderWidget(),
              ),
            );
          },
        )
      ],
    );
  }
}
