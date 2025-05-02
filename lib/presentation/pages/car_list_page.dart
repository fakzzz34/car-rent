import 'package:car_rent/presentation/bloc/car_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import '../bloc/car_event.dart';
import '../bloc/car_state.dart';
import '../widgets/car_card.dart';

class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (_) => getIt<CarBloc>()..add(LoadCars()),

        child: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is CarsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CarsLoaded) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<CarBloc>().add(LoadCars());
                },
                child: ListView.builder(
                  itemCount: state.cars.length,
                  itemBuilder: (context, index) {
                    final car = state.cars[index];
                    return CarCard(car: car);
                  },
                ),
              );
            } else if (state is CarsError) {
              return Center(child: Text('Error : ${state.message}'));
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
