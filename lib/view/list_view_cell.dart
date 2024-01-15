import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors/app_color.dart';
import '../viewmodel/list_view_model.dart';

class ListViewCell extends StatelessWidget {
  final int index;

  ListViewCell(this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(Get.find<ListViewModel>().items[index].title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 38,
            width: 50,
            decoration: BoxDecoration(
              color: AppColor.buttonAmberColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 38,
            width: 50,
            decoration: BoxDecoration(
              color: AppColor.buttonAmberColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.download),
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: AppColor.buttonAmberColor,
            ),
            child: Text(
              'view'.tr,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
