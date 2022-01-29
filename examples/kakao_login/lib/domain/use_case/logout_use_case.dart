import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_login/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<void> call() async {
    await _authRepository.logout();
    await FirebaseAuth.instance.signOut();
  }
}
