import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateProvider extends ChangeNotifier {
  DateTime fromDateTime = DateTime.now();
  TextEditingController fromDateContoller = TextEditingController();

  DateSetter(text) {
    fromDateContoller.text = text;
  }

  Future<DateTime?> showDatePickers(BuildContext context) {
    return showDatePicker(
            context: context,
            initialDate: fromDateTime,
            firstDate: DateTime(2000),
            lastDate: DateTime(2040))
        .then((value) {
      if (value != null) {
        fromDateTime = value;
        fromDateContoller.text = _formatDate(value);
        notifyListeners();
      }
    });
  }



  String _formatDate(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }
}
