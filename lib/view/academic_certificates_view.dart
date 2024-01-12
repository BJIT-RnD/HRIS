import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_demo/components/rectangle_with_ellipse.dart';
import 'package:navigation_demo/utils/colors/app_color.dart';
import 'package:navigation_demo/utils/constant/constant.dart';
import '../viewmodel/list_view_model.dart';
import '../view/list_view_cell.dart';

// class AcademicCertificateView extends StatelessWidget {
//   const AcademicCertificateView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Column(
//         children: [
//           RectangleWithEllipse(),
//           const SizedBox(
//             height: 25,
//           ),
//           Container(
//             height: displayWidth(context) / 5,
//             width: displayWidth(context) / 1.75,
//             decoration: const BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: AppColor.primaryColor,
//             ),
//             child: Center(
//               child: Text(
//                 'academic_certificates'.tr,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: displayHeight(context) / 12,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,

//             children: [
//               TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                   backgroundColor: AppColor.buttonAmberColor,
//                 ),
//                 child: Text(
//                   'bsc_certificate'.tr,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//               Container(
//                 height: 38,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   color: AppColor.buttonAmberColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.edit),
//                 ),
//               ),
//               Container(
//                 height: 38,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   color: AppColor.buttonAmberColor,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(Icons.download),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                   backgroundColor: AppColor.buttonAmberColor,
//                 ),
//                 child: Text(
//                   'view'.tr,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AcademicCertificateView extends StatelessWidget {
//   final ListViewModel listViewModel = Get.put(ListViewModel());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MVVM List View'),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: listViewModel.items.length,
//           itemBuilder: (context, index) {
//             return ListViewCell(index);
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           listViewModel.addItem('New Item');
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

class AcademicCertificateView extends StatelessWidget {
  final ListViewModel listViewModel = Get.put(ListViewModel());
  final TextEditingController labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM List View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: listViewModel.items.length,
                itemBuilder: (context, index) {
                  return ListViewCell(index);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: Get.overlayContext!,
      builder: (context) => AlertDialog(
        title: Text('Add New Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: labelController,
              decoration: InputDecoration(
                labelText: 'Label',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                listViewModel.addItem(labelController.text);
                Get.back(); // Close the dialog
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
