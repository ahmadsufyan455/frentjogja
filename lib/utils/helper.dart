import 'package:frent_jogja/modules/form/form_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Helper {
  final controller = Get.find<FormController>();

  int getTotalDays() {
    return daysBetween(
        DateTime.parse(controller.selectedStartDate.value.toString()),
        DateTime.parse(controller.selectedEndDate.value.toString()));
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
