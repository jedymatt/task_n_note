import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_entity.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<UserEntity?> get user {
    return _auth.authStateChanges().map(
          (user) => (user != null)
              ? UserEntity(
                  uid: user.uid,
                  displayName: user.displayName,
                  photoUrl: user.photoURL,
                )
              : null,
        );
  }

  Future<String> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? e.code;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? e.code;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? e.code;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signInWithGoogle() async {
    try {
      // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAccount? googleUser;

      googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? e.code;
    } catch (e) {
      rethrow;
    }
  }
}
