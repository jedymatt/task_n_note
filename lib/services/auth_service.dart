import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart' as usr;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<usr.User?> get user {
    return _auth.authStateChanges().map(
          (user) => (user != null)
              ? usr.User(
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
      if (_googleSignIn.currentUser != null) {
        await _googleSignIn.signOut();
      } else {
        await _auth.signOut();
      }
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? e.code;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        await _auth.signInWithPopup(googleProvider);
        return 'success';
      }

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _auth.signInWithCredential(credential);

      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message ?? e.code;
    } catch (e) {
      rethrow;
    }
  }
}
