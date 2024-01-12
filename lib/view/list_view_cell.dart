import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          ElevatedButton(
            onPressed: () {
              // Handle edit button click
            },
            child: Text("Edit"),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              // Handle download button click
            },
            child: Text("Download"),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              // Handle view button click
            },
            child: Text("View"),
          ),
        ],
      ),
    );
  }
}
