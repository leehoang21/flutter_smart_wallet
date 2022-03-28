import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_wallet/presentation/widgets/pick_image/pick_image_widget_constant.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    required this.camera,
    required this.gallery,
    Key? key,
  }) : super(key: key);
  final Function(BuildContext context) camera;
  final Function(BuildContext context) gallery;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context, null);
        },
        child: Text(
          PickImageWidgetConstant.cancel,
          style: ThemeText.cancelButton,
        ),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () => gallery(context),
          child: Text(
            PickImageWidgetConstant.gallery,
            style: ThemeText.titleAction,
          ),
        ),
        CupertinoActionSheetAction(
          onPressed: () => camera(context),
          child: Text(
            PickImageWidgetConstant.camera,
            style: ThemeText.titleAction,
          ),
        ),
      ],
    );
  }
}
