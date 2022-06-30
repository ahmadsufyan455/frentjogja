import 'package:frent_jogja/modules/form/form_controller.dart';
import 'package:get/get.dart';

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
}
