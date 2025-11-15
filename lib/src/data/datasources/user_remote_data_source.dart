import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  UserRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required String role,
    required String school,
  }) async {
    final userCred = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final userData = UserModel(
      uid: userCred.user!.uid,
      name: name,
      email: email,
      role: role,
      school: school,
    );

    await firestore
        .collection('users')
        .doc(userCred.user!.uid)
        .set(userData.toMap());

    return userData;
  }

  @override
  Future<UserModel> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final userCred = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final snap = await firestore
        .collection('users')
        .doc(userCred.user!.uid)
        .get();

    return UserModel.fromMap(snap.data()!);
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    // Add your Google sign-in setup here
    throw UnimplementedError("Google Sign-In not yet implemented");
  }

  @override
  Future<UserModel> getCurrentUserProfile() async {
    final user = firebaseAuth.currentUser;

    if (user == null) throw Exception("No logged-in user");

    final snap = await firestore.collection('users').doc(user.uid).get();

    return UserModel.fromMap(snap.data()!);
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
