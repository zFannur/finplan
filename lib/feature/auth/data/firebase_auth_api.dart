import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../app/const/app_firestore_const.dart';
import '../domain/entities/user_entity/user_entity.dart';
import '../domain/auth_api.dart';

@Singleton(as: AuthApi)
class FirebaseAuthApi implements AuthApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  //Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

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
  Future<void> passwordUpdate({required String password}) async {
    try {
      await currentUser?.updatePassword(password);
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
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signUp({
    required String password,
    required String email,
  }) async {
    User? user;

    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;

      if (user != null) {
        final QuerySnapshot result = await firebaseFirestore
            .collection(FirestoreConst.pathUserCollection)
            .where(FirestoreConst.id, isEqualTo: user.uid)
            .get();
        final List<DocumentSnapshot> documents = result.docs;

        if (documents.isEmpty) {
          firebaseFirestore
              .collection(FirestoreConst.pathUserCollection)
              .doc(user.uid)
              .set(
            {
              FirestoreConst.nickName: user.displayName,
              FirestoreConst.photoUrl: user.photoURL,
              FirestoreConst.id: user.uid,
              "createAt": DateTime.now().millisecondsSinceEpoch.toString(),
              FirestoreConst.chattingWith: null,
            },
          );
        }
      }

      return userCredential.toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> userUpdate({String? email, String? username}) async {
    try {
      username != null ? await currentUser?.updateDisplayName(username) : null;
      email != null ? await currentUser?.updateEmail(email) : null;
    } catch (_) {
    rethrow;
    }
  }
}

extension on UserCredential {
  UserEntity toEntity() {
    return UserEntity(
      displayName: user?.displayName ?? '',
      email: user?.email ?? '',
      emailVerified: false,
      isAnonymous: false,
      phoneNumber: user?.phoneNumber ?? '',
      photoURL: user?.photoURL ?? '',
      refreshToken: user?.refreshToken ?? '',
      tenantId: user?.tenantId ?? '',
      uid: user?.uid ?? '',
    );
  }
}
