import '../../../domain/entities/user_entity.dart';

abstract class UserRemoteDataSource{
  Future<String> loggedIn(UserEntity user);
  Future<UserEntity>signIn(UserEntity user);
  Future<void>loggedOut();
}