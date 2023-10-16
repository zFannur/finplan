import 'package:finplan/feature/auth/domain/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../domain/auth_repository.dart';
import '../domain/entities/user_entity/user_entity.dart';

@Injectable(as: AuthRepository)
@prod
@dev
class NetworkAuthRepository
    implements AuthRepository {
  final AuthApi api;

  NetworkAuthRepository(this.api);

  @override
  Future<UserEntity> getProfile() async {
    try {
      final response = await api.getProfile();

      return UserEntity(email: "email", username: "username", id: "id");
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> passwordUpdate({
    required String email,
  }) async {
    try {
      await api.passwordUpdate(email: email);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signIn({
    required String password,
    required String email,
  }) async {
    try {
      final UserCredential response = await api.signIn(
          password: password, email: email);

      return response.toEntity();
      } catch (_)
      {
        rethrow;
      }
    }

  @override
  Future<UserEntity> signUp({
    required String password,
    required String email,
  }) async {
    try {
      final UserCredential response = await api.signUp(
          password: password, email: email);

      return response.toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> userUpdate({
    String? email,
    String? username,
  }) async {
    try {
      final UserCredential response = await api.userUpdate(username: username, email: email);

      return response.toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await api.signOut();
    } catch (_) {
      rethrow;
    }
  }
}

extension on UserCredential {
  UserEntity toEntity() {
    return UserEntity(
      email: user?.email ?? "",
      username: user?.displayName ?? "",
      id: user?.uid ?? "",);
  }
}
