import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/firebase_user_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/user_usecases.dart';
import 'user_notifier.dart';
import 'user_state.dart';

// Firebase SDK instances
final firebaseAuthProvider = Provider<fb.FirebaseAuth>((ref) => fb.FirebaseAuth.instance);
final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// Data source
final firebaseUserDataSourceProvider = Provider<FirebaseUserDataSource>((ref) {
  final auth = ref.read(firebaseAuthProvider);
  final firestore = ref.read(firestoreProvider);
  return FirebaseUserDataSource(auth, firestore);
});

// Repository
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final ds = ref.read(firebaseUserDataSourceProvider);
  return UserRepositoryImpl(ds);
});

// Use-cases
final signInUseCaseProvider = Provider<SignInUseCase>((ref) => SignInUseCase(ref.read(userRepositoryProvider)));
final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) => SignOutUseCase(ref.read(userRepositoryProvider)));
final createUserUseCaseProvider = Provider<CreateUserUseCase>((ref) => CreateUserUseCase(ref.read(userRepositoryProvider)));
final getProfileUseCaseProvider = Provider<GetProfileUseCase>((ref) => GetProfileUseCase(ref.read(userRepositoryProvider)));
final updateProfileUseCaseProvider = Provider<UpdateProfileUseCase>((ref) => UpdateProfileUseCase(ref.read(userRepositoryProvider)));
final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) => GetCurrentUserUseCase(ref.read(userRepositoryProvider)));

// StateNotifierProviders
final userAccountNotifierProvider = StateNotifierProvider<UserAccountNotifier, UserAccountState>((ref) {
  return UserAccountNotifier(
    signIn: ref.read(signInUseCaseProvider),
    signOut: ref.read(signOutUseCaseProvider),
    createUser: ref.read(createUserUseCaseProvider),
    getCurrentUser: ref.read(getCurrentUserUseCaseProvider),
  );
});

final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(
    getProfile: ref.read(getProfileUseCaseProvider),
    updateProfile: ref.read(updateProfileUseCaseProvider),
  );
});
