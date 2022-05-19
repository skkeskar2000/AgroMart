
import 'package:agro_mart/features/domain/entities/user_entity.dart';
import 'package:agro_mart/features/domain/repositories/user_repository.dart';
import '../remote/data_sources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository{

  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<String> loggedIn(UserEntity user) {
    return userRemoteDataSource.loggedIn(user);
  }

  @override
  Future<void> loggedOut() {
    // TODO: implement loggedOut
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signIn(UserEntity user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
  
}