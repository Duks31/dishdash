import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  // firebase instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get current user
  User? get currentUser => _firebaseAuth.currentUser;

  // sign in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, password) async {
    try {
      // sign user in
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, password) async {
    try {
      // sign user up
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
