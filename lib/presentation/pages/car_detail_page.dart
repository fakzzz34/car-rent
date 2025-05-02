import 'package:car_rent/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/car.dart';
import '../widgets/more_card.dart';
import 'maps_detail_page.dart';

class CarDetailPage extends StatefulWidget {
  const CarDetailPage({super.key, required this.car});

  final Car car;

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_animationController!)..addListener(() {
      setState(() {});
    });

    _animationController!.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info_outline), Text(' Information')],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          CarCard(car: widget.car),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0XFFF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/user.jpg'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Fauzan AKbar Khan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$4.253', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapsDetailPage(car: widget.car),
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/maps.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car: Car(
                    model: "${widget.car.model}-1",
                    distance: widget.car.distance + 100,
                    fuelCapacity: widget.car.fuelCapacity + 100,
                    pricePerHour: widget.car.pricePerHour + 10,
                  ),
                ),
                SizedBox(height: 5),
                MoreCard(
                  car: Car(
                    model: "${widget.car.model}-2",
                    distance: widget.car.distance + 200,
                    fuelCapacity: widget.car.fuelCapacity + 200,
                    pricePerHour: widget.car.pricePerHour + 20,
                  ),
                ),
                SizedBox(height: 5),
                MoreCard(
                  car: Car(
                    model: "${widget.car.model}-3",
                    distance: widget.car.distance + 300,
                    fuelCapacity: widget.car.fuelCapacity + 300,
                    pricePerHour: widget.car.pricePerHour + 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
