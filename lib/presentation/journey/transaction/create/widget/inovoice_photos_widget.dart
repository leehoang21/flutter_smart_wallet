import 'package:flutter/material.dart';
import 'package:flutter_smart_wallet/common/constants/image_constants.dart';
import 'package:flutter_smart_wallet/presentation/journey/transaction/create/create_transaction_constants.dart';
import 'package:flutter_smart_wallet/themes/theme_color.dart';
import 'package:flutter_smart_wallet/themes/theme_text.dart';

class InvoicePhotosWidget extends StatelessWidget {
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
              width: CreateTransactionConstants.sizedBoxWidth20,
            ),
            Text(
              CreateTransactionConstants.invoicePhotos,
              style: ThemeText.caption
                  .copyWith(color: AppColor.tuna, fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          height: CreateTransactionConstants.sizedBoxHeight8,
        ),
        Row(
          children: [],
        )
      ],
    );
  }
}
