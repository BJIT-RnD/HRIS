import 'package:get/get.dart';
import '../models/list_item.dart';

class ListViewModel extends GetxController {
  var items = <ListItem>[].obs;

  void addItem(String title) {
    items.add(ListItem(title));
  }

  void removeItem(int index) {
    items.removeAt(index);
  }
}
