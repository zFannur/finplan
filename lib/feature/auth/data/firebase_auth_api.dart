import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../domain/auth_api.dart';

@Singleton(as: AuthApi)
class FirebaseAuthApi implements AuthApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (_) {
      rethrow;
    }

  }

  @override
  Future getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<void> passwordUpdate({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signIn({
    required String password,
    required String email,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> signUp({
    required String password,
    required String email,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future userUpdate({String? email, String? username}) {
    // TODO: implement userUpdate
    throw UnimplementedError();
  }
}
