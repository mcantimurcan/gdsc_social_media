import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void createPersonWithGoogle(GoogleSignInAccount? gUser, uid) async {
    await _firestore.collection("Person").doc(uid).set({
      'name': gUser?.displayName,
      'email': gUser?.email,
      'description': 'Açıklama gir..',
    });
  }

  Future<User?> createPersonWithRegisterPage(
      String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("Person").doc(user.user?.uid).set({
      'name': name,
      'email': email,
      'description': 'Açıklama gir..',
    });

    return user.user;
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    var credentials =
        await FirebaseAuth.instance.signInWithCredential(credential);
    createPersonWithGoogle(gUser, credentials.user?.uid);
  }
}
