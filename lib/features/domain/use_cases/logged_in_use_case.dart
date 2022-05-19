import 'package:agro_mart/features/domain/repositories/user_repository.dart';
import '../entities/user_entity.dart';

class LoggedInUseCase{
  final UserRepository userRepository;

  LoggedInUseCase({required this.userRepository});

  Future<String> call(UserEntity user){
    return userRepository.loggedIn(user);
  }
}