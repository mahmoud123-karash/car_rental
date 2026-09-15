abstract class CarRepo {
  Future<String> updateCar({
    required String brand,
    required int color,
    required String carModel,
    required int year,
  });
}
