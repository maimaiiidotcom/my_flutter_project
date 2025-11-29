import 'package:firebase_auth/firebase_auth.dart' as fb;

enum UserStatus { idle, loading, authenticated, unauthenticated, error }
enum ProfileStatus { idle, loading, loaded, updating, error }

class UserAccountState {
  final UserStatus status;
  final fb.User? user;
  final String? message;

  const UserAccountState({this.status = UserStatus.idle, this.user, this.message});

  UserAccountState copyWith({UserStatus? status, fb.User? user, String? message}) {
    return UserAccountState(
      status: status ?? this.status,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }
}

class ProfileState {
  final ProfileStatus status;
  final Map<String, dynamic>? profile;
  final String? message;

  const ProfileState({this.status = ProfileStatus.idle, this.profile, this.message});

  ProfileState copyWith({ProfileStatus? status, Map<String, dynamic>? profile, String? message}) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      message: message ?? this.message,
    );
  }
}
