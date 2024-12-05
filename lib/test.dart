// class TableScreen extends StatefulWidget {
//   const TableScreen({super.key});
//
//   @override
//   State<TableScreen> createState() => _TableScreenState();
// }
//
// class _TableScreenState extends State<TableScreen> {
//   final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
//   final Map<String, String?> selectedRadioValues = {};
//
//   @override
//   void initState() {
//     super.initState();
//     final tableController = TableController.current;
//     tableController.initializeTableData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<TableController>(builder: (controller) {
//       return Scaffold(
//         resizeToAvoidBottomInset: false,
//         key: drawerKey,
//         appBar: const PreferredSize(
//             preferredSize: Size.fromHeight(60),
//             child: GlobalAppBar(
//               centerTitle: true,
//               title: GlobalText(
//                 str: "Home Page",
//                 fontSize: 14,
//                 color: ColorRes.white,
//               ),
//               leading: SizedBox.shrink(),
//             )),
//         body: GlobalContainer(
//           height: size(context).height,
//           width: size(context).width,
//           color: ColorRes.grey.withOpacity(0.1),
//           child: Column(
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   // width: size(context).width,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: SingleChildScrollView(
//                       child: Table(
//                         border: TableBorder.all(),
//                         children: controller.tableData.map((row) {
//                           return TableRow(
//                             children: row.map((cell) {
//                               return TableCell(
//                                 child: cell == 'edit_text'
//                                     ? GlobalTextFormField(
//                                   keyboardType: TextInputType.number,
//                                   decoration: nonInputField,
//                                 )
//                                     : GlobalText(
//                                   str: cell.toString(),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               );
//                             }).toList(),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               GlobalButtonWidget(
//                 str: "Calculate Sum",
//                 height: 45,
//                 textSize: 12,
//                 onTap: (){},
//               ),
//
//               sizedBoxH(20)
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
