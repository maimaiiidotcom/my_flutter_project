import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

class FirebaseUserDataSource {
  final fb.FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseUserDataSource(this.auth, this.firestore);

  Future<fb.User?> signInWithEmail(String email, String password) async {
    final cred = await auth.signInWithEmailAndPassword(email: email, password: password);
    return cred.user;
  }

  Future<void> signOut() => auth.signOut();

  Future<fb.User?> createUserWithEmail(String email, String password) async {
    final cred = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return cred.user;
  }

  Future<Map<String, dynamic>?> getProfile(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();
    return doc.exists ? doc.data() : null;
  }

  Future<void> setProfile(String uid, Map<String, dynamic> data) {
    return firestore.collection('users').doc(uid).set(data, SetOptions(merge: true));
  }

  Future<fb.User?> getCurrentUser() async => auth.currentUser;
}
