import 'package:car_rent/presentation/pages/car_detail_page.dart';
import 'package:flutter/material.dart';

import '../../data/models/car.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CarDetailPage(car: car)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0XFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 10),
          ],
        ),
        child: Column(
          children: [
            Image.asset('assets/images/car_image.png', height: 120),
            Text(
              car.model,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.near_me_rounded),
                        Text(' ${car.distance.toStringAsFixed(0)}km'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.local_gas_station),
                        Text(' ${car.fuelCapacity.toStringAsFixed(0)}L'),
                      ],
                    ),
                  ],
                ),
                Text(
                  '\$${car.pricePerHour.toStringAsFixed(2)}/h',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
