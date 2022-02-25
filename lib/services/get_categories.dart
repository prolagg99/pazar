// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:pazar/model/model.dart';

// class GetCategories {
//   final CollectionReference categoriesCollection =
//       FirebaseFirestore.instance.collection('categories');
//   List<Categories> categoriesList = [];

// // fetsh data from db to search elements and display it
//   Future<void> getCategories() async {
//     categoriesCollection.get().then((value) {
//       return value.docs.forEach((doc) {
//         print('getDocuments ${doc.data()}');
//         categoriesList.add(
//           Categories(
//             image:
//                 doc.data().toString().contains('image') ? doc.get('image') : '',
//             name: doc.data().toString().contains('name') ? doc.get('name') : '',
//             nameArab: doc.data().toString().contains('nameArab')
//                 ? doc.get('nameArab')
//                 : '',
//           ),
//         );
//       });
//     });
//   }
// }
