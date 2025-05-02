class Car {
  final String model;
  final num distance;
  final num fuelCapacity;
  final num pricePerHour;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      model: json['model'],
      distance: json['distance'] as num,
      fuelCapacity: json['fuelCapacity'] as num,
      pricePerHour: json['pricePerHour'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'distance': distance,
      'fuelCapacity': fuelCapacity,
      'pricePerHour': pricePerHour,
    };
  }
}
