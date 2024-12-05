
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:get/get.dart';
import 'package:soft_task/src/global/utils/show_toast.dart';

class TableController extends GetxController {
  static TableController get current => Get.find();

  var tableData = <List<dynamic>>[];
  var isLoading = false;

  /// ==/@ HTML data as a string
  final String htmlData = '''
<html>
  <head></head>
  <body>
    <figure class="table">
      <table>
        <tbody>
          <tr>
            <td>EditText</td>
            <td>105</td>
          </tr>
          <tr>
            <td>203</td>
            <td>EditText</td>
          </tr>
          <tr>
            <td>EditText</td>
            <td>EditText</td>
          </tr>
          <tr>
            <td>EditText</td>
            <td>406</td>
          </tr>
        </tbody>
      </table>
    </figure>
  </body>
</html>
''';

  /// ==/@ Initialize the table data from the HTML string
  void initializeTableData() {
    try {
      isLoading = true;
      update();
      tableData = parseHtmlToTable(htmlData);

      log("==/@ Table Data: $tableData");

    } catch (e) {
      showCustomSnackBar("Failed to parse data", icon: Icons.info);
      log("Failed to parse data", error: e);
    } finally {
      isLoading = false;
      update();
    }
  }

  /// ==/@ Parse HTML to extract table data
  List<List<dynamic>> parseHtmlToTable(String htmlResponse) {
    final dataParse = html_parser.parse(htmlResponse);
    final tableRows = dataParse.getElementsByTagName('tr');

    return tableRows.map((row) {
      final cells = row.getElementsByTagName('td');
      return cells.map((cell) {
        final text = cell.text.trim();
        return text == "EditText" ? "edit_text" : int.tryParse(text) ?? text;
      }).toList();
    }).toList();
  }

  /// ==/@ Validate and update editable fields
  void validateAndUpdate(int row, int column, String value) {
    final inputValue = int.parse(value);
    if (int.tryParse(value) == null || inputValue < 100 || inputValue > 999) {
      showCustomSnackBar("Invalid Input!! Enter a number between 100 and 999");
      return;
    }

    if (tableData.any((rowData) => rowData.contains(int.parse(value)))) {
      showCustomSnackBar("Duplicate Value!! This number already exists in the table");
      return;
    }

    tableData[row][column] = int.parse(value);
    update();
  }

  /// ==/@ Calculation Data
  int calculateSum() {
    return tableData.fold(0, (sum, row) => sum + row.whereType<int>().fold(0, (subtotal, value) => subtotal + value));
  }
}
