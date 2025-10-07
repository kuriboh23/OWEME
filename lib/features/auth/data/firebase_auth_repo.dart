import 'package:firebase_auth/firebase_auth.dart';
import 'package:oweme/features/auth/domain/entities/app_user.dart';
import 'package:oweme/features/auth/domain/repositories/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return null;
    } else {
      return AppUser(
        uid: firebaseUser.uid,
        email: firebaseUser.email!,
        name: firebaseUser.displayName ?? '',
        balance: 0, owe: 0, owed: 0, friends: [],
      );
    }
  }

  @override
  Future<AppUser?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: userCredential.user!.displayName ?? '',
        balance: 0,
        owe: 0,
        owed: 0,
        friends: [],
      );

      return user;
    } catch (e) {
      throw Exception('Login Failed $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
        balance: 0,
        owe: 0,
        owed: 0,
        friends: [],
      );

      return user;
    } catch (e) {
      throw Exception('Registration Failed $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
