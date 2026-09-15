abstract class ProfileRepo {
  Future<String> updatePassenger({
    required String name,
    required String phone,
    required String job,
    required String gender,
  });
}
