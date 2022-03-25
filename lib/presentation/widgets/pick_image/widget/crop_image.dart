import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/cubit/pick_image_cubit.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/pick_image_screen_constant.dart';

class CropImage extends StatelessWidget {
  CropImage({
    required this.withCircleUi,
    required this.image,
    required this.ctx,
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final BuildContext ctx;
  final CropController _controller = CropController();
  final double width;
  final double height;
  final Uint8List image;
  final bool withCircleUi;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Crop(
            controller: _controller,
            initialArea: sizeImage(),
            withCircleUi: withCircleUi,
            image: image,
            onCropped: (image) async {
              ctx.read<PickImageCubit>().addImage(image);
              Navigator.pop(ctx);
            },
          ),
        ),
        SizedBox.fromSize(
          size: Size(150.w, 100.h),
          child: ElevatedButton(
            onPressed: () {
              if (withCircleUi) {
                _controller.cropCircle();
              } else {
                _controller.crop();
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                PickImageScreenConstant.crop,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Rect sizeImage() {
    if (withCircleUi) {
      if (width < height) {
        return Rect.fromLTWH(0, 0, width, width);
      } else {
        return Rect.fromLTWH(0, 0, height, height);
      }
    }
    return Rect.fromLTWH(0, 0, width, height);
  }
}
