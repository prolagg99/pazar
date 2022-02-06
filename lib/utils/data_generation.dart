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
      category: 'kababji',
      image: img_tacos,
      name: 'tacos poulet L',
      arabic: 'L طاكوس دجاج',
      price: '450.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_pizza,
      name: 'pizza simple L',
      arabic: 'L بيتزا عادية',
      price: '300.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_burger,
      name: 'burger',
      arabic: 'تشيز برقر',
      price: '300.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_tacos,
      name: 'tacos poulet L',
      arabic: 'L طاكوس دجاج',
      price: '450.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_pizza,
      name: 'pizza simple L',
      arabic: 'L بيتزا عادية',
      price: '300.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_burger,
      name: 'burger',
      arabic: 'تشيز برقر',
      price: '300.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_tacos,
      name: 'tacos poulet L',
      arabic: 'L طاكوس دجاج',
      price: '450.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_pizza,
      name: 'pizza simple L',
      arabic: 'L بيتزا عادية',
      price: '300.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_burger,
      name: 'burger',
      arabic: 'تشيز برقر',
      price: '300.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_tacos,
      name: 'tacos poulet L',
      arabic: 'L طاكوس دجاج',
      price: '450.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_pizza,
      name: 'pizza simple L',
      arabic: 'L بيتزا عادية',
      price: '300.00'));
  data.add(Dishes(
      category: 'kababji',
      image: img_burger,
      name: 'burger',
      arabic: 'تشيز برقر',
      price: '300.00'));
  return data;
}

List<Slides> getSlides() {
  List<Slides> data = [];
  data.add(Slides(image: img_slide1));
  data.add(Slides(image: img_slide2));
  data.add(Slides(image: img_slide3));
  return data;
}
