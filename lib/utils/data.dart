import 'package:pazar/model/model.dart';
import 'package:pazar/utils/images.dart';

List<Restaurants> getRestaurantImages() {
  List<Restaurants> data = [];
  data.add(Restaurants(image: img_chami));
  data.add(Restaurants(image: img_chatain));
  data.add(Restaurants(image: img_kababji));
  return data;
}

List<Dishes> getDishes() {
  List<Dishes> data = [];
  data.add(Dishes(
      image: img_tacos,
      name: 'Tacos poulet L',
      arabic: 'L طاكوس دجاج',
      price: '450'));
  data.add(Dishes(
      image: img_pizza,
      name: 'Pizza simple L',
      arabic: 'L بيتزا عادية',
      price: '300'));
  data.add(Dishes(
      image: img_burger, name: 'Burger', arabic: 'تشيز برقر', price: '300'));
  data.add(Dishes(
      image: img_tacos,
      name: 'Tacos poulet L',
      arabic: 'L طاكوس دجاج',
      price: '450'));
  data.add(Dishes(
      image: img_pizza,
      name: 'Pizza simple L',
      arabic: 'L بيتزا عادية',
      price: '300'));
  data.add(Dishes(
      image: img_burger, name: 'Burger', arabic: 'تشيز برقر', price: '300'));
  return data;
}
