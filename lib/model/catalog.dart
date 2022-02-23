import 'package:pazar/model/model.dart';
import 'package:pazar/utils/images.dart';

List<Slides> getSlides() {
  List<Slides> data = [];
  data.add(Slides(image: img_slide1));
  data.add(Slides(image: img_slide2));
  data.add(Slides(image: img_slide3));
  return data;
}

List<Categories> getRestaurantImages() {
  List<Categories> data = [];
  data.add(Categories(image: img_chami));
  data.add(Categories(image: img_chatain));
  data.add(Categories(image: img_kababji));
  return data;
}

class CatalogModel {
  final List<Item> _catalogItems = [
    Item(
        // id: 1,
        category: 'kababji',
        categoryArab: 'كبابجي',
        image: img_tacos,
        name: 'tacos poulet L',
        nameArab: 'L طاكوس دجاج',
        qnt: 1,
        price: 450.00,
        totalPrice: 450.00),
    Item(
        // id: 2,
        category: 'kababji',
        categoryArab: 'كبابجي',
        image: img_pizza,
        name: 'pizza simple L',
        nameArab: 'L بيتزا عادية',
        qnt: 1,
        price: 300.00,
        totalPrice: 300.00),
    Item(
        // id: 3,
        category: 'kababji',
        categoryArab: 'كبابجي',
        image: img_burger,
        name: 'burger',
        nameArab: 'تشيز برقر',
        qnt: 1,
        price: 300.00,
        totalPrice: 300.00),
  ];
  List<Item> get catalogItems => _catalogItems;
}

class Item {
  // final int id;
  String category;
  String categoryArab;
  String image;
  String name;
  String nameArab;
  double price;
  int qnt;
  double totalPrice;
  Item({
    // required this.id,
    required this.category,
    required this.categoryArab,
    required this.image,
    required this.name,
    required this.nameArab,
    required this.price,
    // required this.qnt = 1, try this later
    required this.qnt,
    this.totalPrice = 0.0,
  });
}
