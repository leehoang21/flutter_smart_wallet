import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/add_photo_bloc/add_photo_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddPhotoBloc extends Cubit<AddPhotoState> {
  AddPhotoBloc() : super(AddPhotoState.initial());
}
