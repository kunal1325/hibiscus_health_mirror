
import '../../../../import.dart';

class StartMyJourneyController extends GetxController {


  List<StartMyJourneyModel> startMyJourneyModel = [
    StartMyJourneyModel(Strings.connectedDietitian, Strings.emptyString),
    StartMyJourneyModel(Strings.firstFaceScan, Strings.firstFaceScanDescription),
    StartMyJourneyModel(Strings.firstAssessment, Strings.firstAssessmentDescription)
  ];

  void navigateToFaceScan(){
    Storage.clearStorage();
    Get.offAllNamed("/splash");
    // Get.offAllNamed("/home");
  }

}