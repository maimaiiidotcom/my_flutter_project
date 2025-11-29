import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../datasources/firebase_user_datasource.dart';

abstract class UserRepository {
  Future<fb.User?> signIn(String email, String password);
  Future<void> signOut();
  Future<fb.User?> createUser(String email, String password, Map<String, dynamic> profile);
  Future<Map<String, dynamic>?> getProfile(String uid);
  Future<void> updateProfile(String uid, Map<String, dynamic> data);
  Future<fb.User?> getCurrentUser();
}

class UserRepositoryImpl implements UserRepository {
  final FirebaseUserDataSource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<fb.User?> signIn(String email, String password) => datasource.signInWithEmail(email, password);

  @override
  Future<void> signOut() => datasource.signOut();

  @override
  Future<fb.User?> createUser(String email, String password, Map<String, dynamic> profile) async {
    final user = await datasource.createUserWithEmail(email, password);
    if (user != null) {
      await datasource.setProfile(user.uid, profile);
    }
    return user;
  }

  @override
  Future<Map<String, dynamic>?> getProfile(String uid) => datasource.getProfile(uid);

  @override
  Future<void> updateProfile(String uid, Map<String, dynamic> data) => datasource.setProfile(uid, data);

  @override
  Future<fb.User?> getCurrentUser() => datasource.getCurrentUser();
}
