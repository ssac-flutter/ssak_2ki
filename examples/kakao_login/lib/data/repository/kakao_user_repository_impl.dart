import 'package:kakao_login/data/data_source/remote/kakao_api.dart';
import 'package:kakao_login/domain/model/user_model.dart';
import 'package:kakao_login/domain/repository/auth_repository.dart';
import 'package:kakao_login/domain/repository/user_repository.dart';

class KakaoUserRepositoryImpl implements UserRepository {
  final _api = KakaoApi();

  final AuthRepository _authRepository;

  KakaoUserRepositoryImpl(this._authRepository);

  @override
  Future<UserModel> getUser() async {
    // _authRepository.login()
    // return _api.getUser(accessToken);
    return UserModel(displayName: 'displayName', email: 'email', photoUrl: 'photoUrl');
  }
}
