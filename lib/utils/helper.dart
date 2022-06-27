import 'package:frent_jogja/modules/form/form_controller.dart';
import 'package:get/get.dart';

class Helper {
  final controller = Get.find<FormController>();

  // TODO: fix bug date day (one character)

  int getTotalDays() {
    final yyStart = int.parse(controller.startDateController.text.substring(5));
    final mmStart = int.parse(controller.startDateController.text[0]);
    final ddStart =
        int.parse(controller.startDateController.text.substring(2, 4));

    final yyEnd = int.parse(controller.endDateController.text.substring(5));
    final mmEnd = int.parse(controller.endDateController.text[0]);
    final ddEnd = int.parse(controller.endDateController.text.substring(2, 4));

    final startDate = DateTime(yyStart, mmStart, ddStart);
    final endDate = DateTime(yyEnd, mmEnd, ddEnd);

    final days = endDate.difference(startDate).inDays;

    return days;
  }
}
