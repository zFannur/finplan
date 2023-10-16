import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../app/domain/error_entity/error_entity.dart';
import '../auth_repository.dart';
import '../entities/user_entity/user_entity.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

part 'auth_cubit.g.dart';

@Singleton()
class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState.notAuthorized());

  final AuthRepository authRepository;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.waiting());
    try {
      final UserEntity userEntity = await authRepository.signIn(
        password: password,
        email: email,
      );
      emit(AuthState.authorized(userEntity));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> signUp({
    required String password,
    required String email,
  }) async {
    emit(const AuthState.waiting());
    try {
      final UserEntity userEntity = await authRepository.signUp(
        password: password,
        email: email,
      );
      emit(AuthState.authorized(userEntity));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> getProfile() async {
    try {
      _updateUserState(const AsyncSnapshot.waiting());
      final UserEntity newUserEntity = await authRepository.getProfile();
      emit(state.maybeWhen(
        orElse: () => state,
        authorized: (userEntity) => AuthState.authorized(
          userEntity.copyWith(
            email: newUserEntity.email,
            username: newUserEntity.username,
          ),
        ),
      ));
      _updateUserState(const AsyncSnapshot.withData(
          ConnectionState.done, "Успешное получение данных"));
    } catch (error) {
      _updateUserState(AsyncSnapshot.withError(ConnectionState.done, error));
    }
  }

  Future<void> userUpdate({
    String? username,
    String? email,
  }) async {
    try {
      _updateUserState(const AsyncSnapshot.waiting());
      final bool isEmptyEmail = email?.trim().isEmpty == true;
      final bool isEmptyUsername = username?.trim().isEmpty == true;

      final UserEntity newUserEntity = await authRepository.userUpdate(
        email: isEmptyEmail ? null : email,
        username: isEmptyUsername ? null : username,
      );
      emit(
        state.maybeWhen(
          orElse: () => state,
          authorized: (userEntity) => AuthState.authorized(
            userEntity.copyWith(
              email: newUserEntity.email,
              username: newUserEntity.username,
            ),
          ),
        ),
      );
      _updateUserState(const AsyncSnapshot.withData(
        ConnectionState.done,
        "Успешное обновление данных",
      ));
    } catch (error) {
      _updateUserState(AsyncSnapshot.withError(
        ConnectionState.done,
        error,
      ));
    }
  }

  Future<void> passwordUpdate({required String email}) async {
    try {
      _updateUserState(const AsyncSnapshot.waiting());

      if (email.contains('@') != true) {
        throw ErrorEntity(message: "Введите корректную почту");
      }

      await authRepository.passwordUpdate(email: email);

      _updateUserState(const AsyncSnapshot.withData(
        ConnectionState.done,
        'Письмо отправлено',
      ));
    } catch (error) {
      _updateUserState(AsyncSnapshot.withError(
        ConnectionState.done,
        error,
      ));
    }
  }

  void logOut() async {
    try {
      await authRepository.signOut();
      emit(const AuthState.notAuthorized());
    } catch (error) {
      _updateUserState(AsyncSnapshot.withError(
        ConnectionState.done,
        error,
      ));
    }
  }

  void _updateUserState(AsyncSnapshot asyncSnapshot) {
    emit(
      state.maybeWhen(
        orElse: () => state,
        authorized: (userEntity) {
          return AuthState.authorized(
              userEntity.copyWith(userState: asyncSnapshot));
        },
      ),
    );
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    final state = AuthState.fromJson(json);
    return state.whenOrNull(
      authorized: (userEntity) => AuthState.authorized(userEntity),
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state
            .whenOrNull(
                authorized: (userEntity) => AuthState.authorized(userEntity))
            ?.toJson() ??
        const AuthState.notAuthorized().toJson();
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(AuthState.error(error));
    super.addError(error, stackTrace);
  }
}
