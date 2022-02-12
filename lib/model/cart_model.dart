import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:pazar/model/model.dart';

class CartModel extends ChangeNotifier {
  final List<Dishes> _items = [];

  /// An unmodifiable view of the items in the cart.
  List<Dishes> get items => _items;

  /// The current total price of all items (assuming all items cost $42).
  double get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void addItem(item) {
    _items.add(item);
    notifyListeners();
  }

// try this to update the qnt & the price of each item in the cart
  void updateItemQnt(index, qnt, price) {
    _items[index].qnt = qnt;
    _items[index].price = price;
  }

  void remove(int index) {
    _items.removeAt(index);
  }
}
