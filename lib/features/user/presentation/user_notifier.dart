import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../domain/usecases/user_usecases.dart';
import 'user_state.dart';

class UserAccountNotifier extends StateNotifier<UserAccountState> {
  // All corresponding use-cases in the domain layer are attributes here
  final SignInUseCase signIn;
  final SignOutUseCase signOut;
  final CreateUserUseCase createUser;
  final GetCurrentUserUseCase getCurrentUser;

  UserAccountNotifier({
    required this.signIn,
    required this.signOut,
    required this.createUser,
    required this.getCurrentUser,
  }) : super(const UserAccountState());

  Future<void> loadCurrentUser() async {
    state = state.copyWith(status: UserStatus.loading);
    print('Loading current user...');
    try {
      final user = await getCurrentUser.call();
      if (user != null) {
        state = state.copyWith(status: UserStatus.authenticated, user: user);
        print('User loaded: ${user.uid}');
      } else {
        state = state.copyWith(status: UserStatus.unauthenticated, user: null);
        print('No user signed in');
      }
    } catch (e) {
      state = state.copyWith(status: UserStatus.error, message: e.toString());
      print('Error loading current user: $e');
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    state = state.copyWith(status: UserStatus.loading);
    print('Signing in...');
    try {
      final user = await signIn.call(email, password);
      state = state.copyWith(status: user != null ? UserStatus.authenticated : UserStatus.unauthenticated, user: user);
      print('Sign in result: ${user?.uid}');
    } catch (e) {
      state = state.copyWith(status: UserStatus.error, message: e.toString());
      print('Sign in error: $e');
    }
  }

  Future<void> signOutUser() async {
    state = state.copyWith(status: UserStatus.loading);
    print('Signing out...');
    try {
      await signOut.call();
      state = const UserAccountState(status: UserStatus.unauthenticated, user: null);
      print('Signed out');
    } catch (e) {
      state = state.copyWith(status: UserStatus.error, message: e.toString());
      print('Sign out error: $e');
    }
  }

  Future<void> createAccount(String email, String password, Map<String, dynamic> profile) async {
    state = state.copyWith(status: UserStatus.loading);
    print('Creating account...');
    try {
      final user = await createUser.call(email, password, profile);
      state = state.copyWith(status: user != null ? UserStatus.authenticated : UserStatus.unauthenticated, user: user);
      print('Account created: ${user?.uid}');
    } catch (e) {
      state = state.copyWith(status: UserStatus.error, message: e.toString());
      print('Create account error: $e');
    }
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final GetProfileUseCase getProfile;
  final UpdateProfileUseCase updateProfile;

  ProfileNotifier({
    required this.getProfile,
    required this.updateProfile,
  }) : super(const ProfileState());

  Future<void> loadProfile(String uid) async {
    state = state.copyWith(status: ProfileStatus.loading);
    print('Loading profile for $uid...');
    try {
      final profile = await getProfile.call(uid);
      state = state.copyWith(status: ProfileStatus.loaded, profile: profile);
      print('Profile loaded for $uid');
    } catch (e) {
      state = state.copyWith(status: ProfileStatus.error, message: e.toString());
      print('Load profile error: $e');
    }
  }

  Future<void> saveProfile(String uid, Map<String, dynamic> data) async {
    state = state.copyWith(status: ProfileStatus.updating);
    print('Updating profile for $uid...');
    try {
      await updateProfile.call(uid, data);
      final updated = await getProfile.call(uid);
      state = state.copyWith(status: ProfileStatus.loaded, profile: updated);
      print('Profile updated for $uid');
    } catch (e) {
      state = state.copyWith(status: ProfileStatus.error, message: e.toString());
      print('Update profile error: $e');
    }
  }
}
