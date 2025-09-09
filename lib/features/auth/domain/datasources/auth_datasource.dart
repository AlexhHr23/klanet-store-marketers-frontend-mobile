import '../entities/entities.dart';

abstract class AuthDatasource {
  Future<void> register(
    String name,
    String lastName,
    String username,
    String phoneNumber,
    String password,
    String? code,
  );

  Future<User> getUser(String accessToken);
}
