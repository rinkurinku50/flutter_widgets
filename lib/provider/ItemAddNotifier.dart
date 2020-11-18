import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_example/provider/Item.dart';

class ItemAddNotifier extends ChangeNotifier {
  List<Item> itemList = [];

  addItem(String itemName) {
    Item item = Item(itemName);
    itemList.add(item);
    notifyListeners();
  }
}
