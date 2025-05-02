import 'package:car_rent/data/models/car.dart';
import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0XFF212020),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black54, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.model,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.directions_car_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '> ${car.distance} km',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Icon(
                    Icons.battery_full_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${car.fuelCapacity} L',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
