
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_appbar.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../controller/input_type_controller.dart';

class InputTypeScreen extends StatefulWidget {
  const InputTypeScreen({super.key});

  @override
  State<InputTypeScreen> createState() => _InputTypeScreenState();
}

class _InputTypeScreenState extends State<InputTypeScreen> {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  final Map<String, String?> selectedRadioValues = {};

  @override
  void initState() {
    super.initState();
    final inputTypeController = InputTypeController.current;

    inputTypeController.getInputTypes();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputTypeController>(builder: (controller) {
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
            )
        ),
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.grey.withOpacity(0.1),
          child: SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          ),
        ),
      );
    });
  }
}


// body: GlobalContainer(
//     height: size(context).height,
//     width: size(context).width,
//     color: ColorRes.grey.withOpacity(0.1),
//     child: ListView.builder(
//         itemCount: 1,
//         shrinkWrap: true,
//         itemBuilder: (ctx, index){
//         final attributesData = jsonResponse?.attributes?[index];
//         return Column(
//             children: [
//
//               attributesData?.type == 'radio' ?
//               RadioListTitleFiled(
//                   title: "Include Outdoor Area",
//                   radioList: attributesData?.options ?? []
//               ) : const SizedBox.shrink(),
//
//               sizedBoxH(5),
//               attributesData?.type == 'dropdown' ?
//               DropDownTitleFiled(
//                 title1: "Number of Bedrooms",
//                 title2: "Number of Bedrooms",
//                 radioList1: attributesData?.options ?? [],
//                 radioList2: attributesData?.options ?? []
//               ) : const SizedBox.shrink(),
//
//               attributesData?.type == 'radio' ?
//               RadioListTitleFiled(
//                   title: "Cleaning Frequency",
//                   radioList: attributesData?.options ?? []
//               ) : const SizedBox.shrink(),
//
//               sizedBoxH(5),
//               const CheckTitleFiled(
//                 title: "Include Garage Cleaning",
//                 radioList: ['One Time', 'Weekly', 'Mobile Banking'],
//               ),
//
//               sizedBoxH(5),
//               const CheckTitleFiled(
//                 title: "Include Outdoor Area",
//                 radioList: ['One Time', 'Weekly', 'Mobile Banking'],
//               ),
//
//               sizedBoxH(5),
//               TextTitleFiled(
//                 title1: "Preferred Cleaning Time",
//                 timeController: timeController,
//               ),
//
//               sizedBoxH(5),
//               Container(
//                 width: size(context).width,
//                 color: ColorRes.white,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     sizedBoxH(20),
//                     GlobalButtonWidget(
//                         str: 'Submit',
//                         height: 40,
//                         radius: 8,
//                         textSize: 12,
//                         horizontal: 10,
//                         buttomColor: ColorRes.primaryColor,
//                         onTap: () async{
//
//                         }
//                     ),
//                     sizedBoxH(20),
//                   ],
//                 ),
//               ),
//
//             ],
//           );
//       }
//     )
// ),
