import '../entities/user.dart';

abstract class UserRepository {
  Future<User> getCurrentUser();
  Future<void> createUser(User user);
}
