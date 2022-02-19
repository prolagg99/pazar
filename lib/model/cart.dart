// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pazar/model/catalog.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];
  int _itemsInCart = 0;

  List<Item> get items => _items;
  int get itemsInCart => _itemsInCart;

  /// The current total price of all items
  double get totalPrice =>
      items.fold(0, (total, current) => total + current.totalPrice);

  void addItemToCart() {
    _itemsInCart += 1;
    notifyListeners();
  }

  void removeItemFromCart() {
    _itemsInCart -= 1;
    notifyListeners();
  }

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

// update the qnt & the price of each item in the cart
  void updateItemQnt(index, qnt, total) {
    _items[index].qnt = qnt;
    _items[index].totalPrice = total;
    totalPrice;
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
