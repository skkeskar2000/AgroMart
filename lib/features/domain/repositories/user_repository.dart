
import 'package:agro_mart/features/domain/entities/user_entity.dart';

abstract class UserRepository{
  Future <String>loggedIn(UserEntity user);
  Future<UserEntity>signIn(UserEntity user);
  Future<void>loggedOut();
}