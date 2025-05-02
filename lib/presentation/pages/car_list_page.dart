import 'package:flutter/material.dart';

import '../../data/models/car.dart';
import '../widgets/car_card.dart';

class CarListPage extends StatelessWidget {
  CarListPage({super.key});

  final List<Car> cars = [
    Car(
      model: 'Fortuner GR',
      distance: 200,
      fuelCapacity: 40,
      pricePerHour: 200,
    ),
    Car(
      model: 'Pajero Sport',
      distance: 300,
      fuelCapacity: 50,
      pricePerHour: 250,
    ),
    Car(model: 'Camry', distance: 400, fuelCapacity: 60, pricePerHour: 300),
    Car(model: 'Corolla', distance: 500, fuelCapacity: 70, pricePerHour: 350),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            final car = cars[index];
            return CarCard(car: car);
          },
        ),
      ),
    );
  }
}
