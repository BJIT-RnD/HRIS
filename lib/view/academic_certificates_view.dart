import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_demo/components/rectangle_with_ellipse.dart';
import 'package:navigation_demo/utils/colors/app_color.dart';
import 'package:navigation_demo/utils/constant/constant.dart';
import 'package:navigation_demo/view/profile_view.dart';
import '../viewmodel/list_view_model.dart';
import '../view/list_view_cell.dart';

class AcademicCertificateView extends StatelessWidget {
  final ListViewModel listViewModel = Get.put(ListViewModel());
  final TextEditingController labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              RectangleWithEllipse(),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: IconButton(
                  onPressed: () {
                    Get.off(const ProfileView());
                  },
                  icon: const Icon(Icons.navigate_before),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: displayWidth(context) / 5,
            width: displayWidth(context) / 1.75,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColor.primaryColor,
            ),
            child: Center(
              child: Text(
                'academic_certificates'.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: displayHeight(context) / 12,
          ),
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
        backgroundColor: const Color.fromRGBO(137, 222, 165, 1),
        onPressed: () {
          _showAddItemDialog();
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: Get.overlayContext!,
      builder: (context) => AlertDialog(
        title: const Text('Add New Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: labelController,
              decoration: const InputDecoration(
                labelText: 'Certificate Name',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                listViewModel.addItem(labelController.text);
                Get.back(); // Close the dialog
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
