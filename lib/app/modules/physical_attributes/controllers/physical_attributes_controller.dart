
import '../../../../import.dart';

class PhysicalAttributesController extends GetxController {

  final DataCollectionController dataCollectionController =
  Get.find<DataCollectionController>();

  final heightFtFocusNode = FocusNode();
  final heightInFocusNode = FocusNode();
  final weightFocusNode = FocusNode();
  final heightFtController = TextEditingController();
  final heightInController = TextEditingController();
  final weightController = TextEditingController();

  String? isValidHeightFt(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyHeightFtError;
    } else if (int.parse(text) > 6) {
      return Strings.invalidHeightFtError;
    } else if (int.parse(text) < 4) {
      return Strings.invalidLessHeightFtError;
    } else
      return null;
  }

  String? isValidHeightIn(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyHeightInError;
    } else
      return null;
  }

  String? isValidWeight(String? text) {
    if (text!.isEmpty) {
      return Strings.emptyWeightError;
    } else if (int.parse(text) > 275) {
      return Strings.invalidWeightError;
    } else if (int.parse(text) < 80) {
      return Strings.invalidWeightError;
    } else
      return null;
  }

}
