import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_wallet/common/constants/app_dimens.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/common/constants/layout_constants.dart';
import 'package:flutter_smart_wallet/common/utils/pick_image_function.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/add_photo/add_photo_bloc.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/bloc/add_photo/add_photo_state.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/widget/add_photo_button.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class InvoicePhotosWidget extends StatefulWidget {
  @override
  State<InvoicePhotosWidget> createState() => _InvoicePhotosWidgetState();
}

class _InvoicePhotosWidgetState extends State<InvoicePhotosWidget> {
  late AddPhotoBloc _addPhotoBloc;

  @override
  void initState() {
    _addPhotoBloc = BlocProvider.of<AddPhotoBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              ImageConstants.colorCamera,
            ),
            SizedBox(
              width: AppDimens.width_20,
            ),
            Text(
              CreateTransactionConstants.invoicePhotos,
              style: ThemeText.caption
                  .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          height: AppDimens.height_8,
        ),
        BlocBuilder<AddPhotoBloc, AddPhotoState>(
            bloc: _addPhotoBloc,
            builder: (context, state) {
              final _photos = state.photos;
              final _length = _photos.length;
              return GridView.count(
                crossAxisCount: 3,
                primary: false,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(_length + 1, (index) {
                  if (index == _length) {
                    return AddPhotoButton(addPhoto: _addPhoto);
                  } else {
                    final photo = _photos[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(LayoutConstants.roundedRadius),
                      ),
                      child: Image.memory(
                        photo,
                        fit: BoxFit.fill,
                        width: AppDimens.height_100,
                        height: AppDimens.height_100,
                      ),
                    );
                  }
                }),
              );
            })
      ],
    );
  }

  void _addPhoto() {
    pickImageFuncion(
      context: context,
      camera: (_) {
        _addPhotoBloc.openCamera();
        Navigator.pop(context);
      },
      gallery: (_) {
        _addPhotoBloc.openGallery();
        Navigator.pop(context);
      },
    );
  }
}
