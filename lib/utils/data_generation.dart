import 'package:pazar/model/model.dart';
import 'package:pazar/utils/images.dart';

List<Restaurants> getRestaurantImages() {
  List<Restaurants> data = [];
  data.add(Restaurants(image: img_chami));
  data.add(Restaurants(image: img_chatain));
  data.add(Restaurants(image: img_kababji));
  return data;
}

List<Dishes> cartItems = [];

void setItems(model) {
  cartItems
      .add(Dishes(name: model.name, image: model.image, price: model.price));
}

List<Dishes> getItems() {
  return cartItems;
}

List<Dishes> getDishes() {
  List<Dishes> data = [];
  data.add(Dishes(
      category: 'kababji',
      categoryArab: 'كبابجي',
      image: img_tacos,
      name: 'tacos poulet L',
      nameArab: 'L طاكوس دجاج',
      price: 450.00));
  data.add(Dishes(
      category: 'kababji',
      categoryArab: 'كبابجي',
      image: img_pizza,
      name: 'pizza simple L',
      nameArab: 'L بيتزا عادية',
      price: 300.00));
  data.add(Dishes(
      category: 'kababji',
      categoryArab: 'كبابجي',
      image: img_burger,
      name: 'burger',
      nameArab: 'تشيز برقر',
      price: 300.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_tacos,
  //     name: 'tacos poulet L',
  //     nameArab: 'L طاكوس دجاج',
  //     price: 450.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_pizza,
  //     name: 'pizza simple L',
  //     nameArab: 'L بيتزا عادية',
  //     price: 300.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_burger,
  //     name: 'burger',
  //     nameArab: 'تشيز برقر',
  //     price: 300.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_tacos,
  //     name: 'tacos poulet L',
  //     nameArab: 'L طاكوس دجاج',
  //     price: 450.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_pizza,
  //     name: 'pizza simple L',
  //     nameArab: 'L بيتزا عادية',
  //     price: 300.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_burger,
  //     name: 'burger',
  //     nameArab: 'تشيز برقر',
  //     price: 300.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     image: img_tacos,
  //     name: 'tacos poulet L',
  //     nameArab: 'L طاكوس دجاج',
  //     price: 450.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     image: img_pizza,
  //     name: 'pizza simple L',
  //     nameArab: 'L بيتزا عادية',
  //     price: 300.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     image: img_burger,
  //     name: 'burger',
  //     nameArab: 'تشيز برقر',
  //     price: 300.00));

  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_tacos,
  //     name: 'tacos poulet L',
  //     nameArab: 'L طاكوس دجاج',
  //     price: 450.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_tacos,
  //     name: 'tacos poulet L',
  //     nameArab: 'L طاكوس دجاج',
  //     price: 450.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_tacos,
  //     name: 'tacos poulet L',
  //     nameArab: 'L طاكوس دجاج',
  //     price: 450.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_tacos,
  //     name: 'tacos poulet L',
  //     nameArab: 'L طاكوس دجاج',
  //     price: 450.00));
  // data.add(Dishes(
  //     category: 'kababji',
  //     categoryArab: 'كبابجي',
  //     image: img_tacos,
  //     name: 'tacos poulet L',
  //     nameArab: 'L طاكوس دجاج',
  //     price: 450.00));
  return data;
}

List<Slides> getSlides() {
  List<Slides> data = [];
  data.add(Slides(image: img_slide1));
  data.add(Slides(image: img_slide2));
  data.add(Slides(image: img_slide3));
  return data;
}
