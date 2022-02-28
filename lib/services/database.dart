import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pazar/model/catalog.dart';
import 'package:pazar/model/model.dart';

class DataBaseService {
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('categories');

  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('items');

  // category list from snapshot
  List<Categories> _categoryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Categories(
        image: doc.data().toString().contains('image') ? doc.get('image') : '',
        name: doc.data().toString().contains('name') ? doc.get('name') : '',
        nameArab: doc.data().toString().contains('nameArab')
            ? doc.get('nameArab')
            : '',
      );
    }).toList();
  }

  // item list from snapshot
  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Item(
        category: doc.data().toString().contains('category')
            ? doc.get('category')
            : '',
        categoryArab: doc.data().toString().contains('categoryArab')
            ? doc.get('categoryArab')
            : '',
        image: doc.data().toString().contains('image') ? doc.get('image') : '',
        name: doc.data().toString().contains('name') ? doc.get('name') : '',
        nameArab: doc.data().toString().contains('name_arab')
            ? doc.get('name_arab')
            : '',
        qnt: doc.data().toString().contains('qnt') ? doc.get('qnt') : 1,
        // the price double ;
        price: doc.data().toString().contains('price')
            ? doc.get('price').toDouble()
            : 0.0,
        totalPrice: doc.data().toString().contains('total_price')
            ? doc.get('total_price').toDouble()
            : 0.0,
      );
    }).toList();
  }

  // get category stream
  Stream<List<Categories>> get categories {
    return categoryCollection.snapshots().map(_categoryListFromSnapshot);
  }

  // get category stream
  Stream<List<Item>> get items {
    return itemCollection.snapshots().map(_itemListFromSnapshot);
  }
}
