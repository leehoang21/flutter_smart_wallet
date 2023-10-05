import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AmountInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }
    final oldValueText = oldValue.text.replaceAll(new RegExp(r'[^0-9]'), '');
    String newValueText = newValue.text.replaceAll(new RegExp(r'[^0-9]'), '');
    if (oldValueText == newValueText) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }
    if (newValueText.isEmpty) {
      newValueText = '0';
    }
    double value = double.parse(newValueText);

    final formatter = NumberFormat.simpleCurrency(locale: "vi_VN");

    String newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}

String formatDateMonth(DateTime time) {
  if (time.day == 1) {
    return DateFormat('MMM, d').format(time) + 'st';
  } else if (time.day == 2) {
    return DateFormat('MMM, d').format(time) + 'nd';
  } else if (time.day == 3) {
    return DateFormat('MMM, d').format(time) + 'rd';
  }
  return DateFormat('MMM, d').format(time) + 'th';
}

String formatYear(DateTime time) {
  return DateFormat('MMM, yyyy').format(time);
}
