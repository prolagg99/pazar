import 'package:pazar/model/model.dart';
import 'package:pazar/utils/images.dart';

List<Restaurants> getRestaurantImages() {
  List<Restaurants> data = [];
  data.add(Restaurants(image: img_chami));
  data.add(Restaurants(image: img_chatain));
  data.add(Restaurants(image: img_kababji));
  return data;
}
