import 'package:pazar/model/model.dart';
import 'package:pazar/utils/images.dart';

List<Slides> getSlides() {
  List<Slides> data = [];
  data.add(Slides(image: img_slide1));
  data.add(Slides(image: img_slide2));
  data.add(Slides(image: img_slide3));
  return data;
}

class Item {
  String category;
  String categoryArab;
  String image;
  String name;
  String nameArab;
  double price;
  int qnt;
  double totalPrice;
  Item({
    required this.category,
    required this.categoryArab,
    required this.image,
    required this.name,
    required this.nameArab,
    required this.price,
    required this.qnt,
    this.totalPrice = 0.0,
  });
}
