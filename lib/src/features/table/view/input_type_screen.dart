import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soft_task/src/global/constants/input_decoration.dart';
import 'package:soft_task/src/global/widget/global_bottom_widget.dart';
import 'package:soft_task/src/global/widget/global_textform_field.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_appbar.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../controller/input_type_controller.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  final Map<String, String?> selectedRadioValues = {};

  int? sumResult;

  @override
  void initState() {
    super.initState();
    final tableController = TableController.current;
    tableController.initializeTableData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TableController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        key: drawerKey,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: GlobalAppBar(
              centerTitle: true,
              title: GlobalText(
                str: "Home Page",
                fontSize: 14,
                color: ColorRes.white,
              ),
              leading: SizedBox.shrink(),
            )),
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.grey.withOpacity(0.3),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              sizedBoxH(20),
              Expanded(
                child: Table(
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.7)
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                  },
                  children: controller.tableData.map((row) {
                    return TableRow(
                      children: row.map((cell) {
                        return TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: cell == 'edit_text'
                                ? GlobalTextFormField(
                              keyboardType: TextInputType.number,
                              decoration: nonInputField,
                              hintText: "Enter Value",
                              isDense: true,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.validateAndUpdate(
                                    controller.tableData.indexOf(row),
                                    row.indexOf(cell),
                                    value,
                                  );
                                }
                              },
                            )
                                : Center(
                                child: GlobalText(
                                  str: cell.toString(),
                                )
                            )
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(
                width: size(context).width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      child: GlobalText(
                        str: "Result: ",
                        color: ColorRes.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GlobalText(
                      str: sumResult != null ? sumResult.toString() : "",
                      fontSize: 20,
                    ),
                  ],
                ),
              ),

              sizedBoxH(10),
              GlobalButtonWidget(
                str: "Calculation",
                height: 45,
                onTap: () {
                  setState(() {
                    sumResult = controller.calculateSum();
                  });
                },
              ),
              sizedBoxH(20)
            ],
          ),
        ),
      );
    });
  }
}
