import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/car.dart';

class FirebaseCarDataSource {
  FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection('cars').get();

    return snapshot.docs.map((doc) => Car.fromJson(doc.data())).toList();
  }
}
