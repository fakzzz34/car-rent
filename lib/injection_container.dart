import 'dart:developer';

import 'package:car_rent/data/datasources/firebase_car_data_source.dart';
import 'package:car_rent/data/repositories/car_repository_impl.dart';
import 'package:car_rent/domain/repositories/car_repository.dart';
import 'package:car_rent/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'domain/usecases/get_cars.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()),
    );

    getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImpl(
        firebaseCarDataSource: getIt<FirebaseCarDataSource>(),
      ),
    );

    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));

    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    log('Error : $e');

    throw e;
  }
}
