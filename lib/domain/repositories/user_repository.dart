import '../entities/user.dart';

abstract class UserRepository {
  Future<User> getCurrentUser();
  Future<int> createUser(User user);
}
