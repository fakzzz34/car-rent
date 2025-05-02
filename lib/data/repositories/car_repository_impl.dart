import 'package:car_rent/data/datasources/firebase_car_data_source.dart';
import 'package:car_rent/data/models/car.dart';
import 'package:car_rent/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource firebaseCarDataSource;

  CarRepositoryImpl({required this.firebaseCarDataSource});

  @override
  Future<List<Car>> fetchCars() {
    return firebaseCarDataSource.getCars();
  }
}
