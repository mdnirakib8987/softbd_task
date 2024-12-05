
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart' as root_bundle;
import '../../../domain/server/http_client/api_helper.dart';
import '../model/input_type_model.dart';

class InputTypeRepo extends ApiHelper {

  Future<InputTypeModel?> fetchInputTypes() async {

    try {
      final String response = await root_bundle.rootBundle.loadString('assets/images/input_type.json');

      final Map<String, dynamic> addressDemoResponse = json.decode(response);
      InputTypeModel resWrap = InputTypeModel.fromJson(addressDemoResponse);

      return resWrap;
    } catch (e) {
      log("Error loading address data: $e");
    }
    return null;
  }
}
