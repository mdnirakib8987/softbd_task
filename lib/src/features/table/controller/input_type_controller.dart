import 'dart:developer';
import 'package:get/get.dart';
import '../model/input_type_model.dart';
import 'input_type_repo.dart';

class TableController extends GetxController {
  static TableController get current => Get.find();
  final InputTypeRepo repository = InputTypeRepo();

  InputTypeModel? inputTypeModel;

  Future getInputTypes() async {
    try {
      final res = await repository.fetchInputTypes();

      if (res != null) {
        inputTypeModel = res;
        update();
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  final Map<String, bool> requiredStatus = {};

  final Map<String, String?> selectedRadioValues = {};
  void updateSelectedRadioValue(String id, String? value) {
    selectedRadioValues[id] = value;
    requiredStatus[id] = value != null;
    update();
  }

  final Map<String, Map<String, bool>> selectedCheckboxValues = {};
  void updateSelectedCheckboxValue(String id, String option, bool isSelected) {
    if (selectedCheckboxValues[id] == null) {
      selectedCheckboxValues[id] = {};
    }
    selectedCheckboxValues[id]?[option] = isSelected;
    update();
  }

}
