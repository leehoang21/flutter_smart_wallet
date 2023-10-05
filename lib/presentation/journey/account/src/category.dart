import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/presentation/widgets/app_image_widget.dart';

// ignore: must_be_immutable
class Categori extends StatelessWidget {
  Categori({
    Key? key,
    required this.pathImage,
    required this.title,
    required this.action,
  }) : super(key: key);
  String title;
  String pathImage;
  Function() action;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      leading: AppImageWidget(path: pathImage),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: action,
    );
  }
}
