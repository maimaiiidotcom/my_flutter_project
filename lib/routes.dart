import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/user/presentation/providers.dart';
import 'features/user/presentation/screens/welcome_screen.dart';
import 'features/user/presentation/screens/login_screen.dart';
import 'features/user/presentation/screens/signup_screen.dart';
import 'features/user/presentation/screens/teacher_dashboard.dart';
import 'features/user/presentation/screens/student_dashboard.dart';

// Minimal auth info used for route guarding
class AuthInfo {
  final bool authenticated;
  final String? uid;
  final String? role; // 'teacher' | 'student' | null

  const AuthInfo({required this.authenticated, this.uid, this.role});
}

// Derived provider that reads user & profile state to determine auth + role
final authInfoProvider = Provider<AuthInfo>((ref) {
  final userState = ref.watch(userAccountNotifierProvider);
  final profileState = ref.watch(profileNotifierProvider);

  final authenticated = userState.status == UserStatus.authenticated && userState.user != null;
  final uid = userState.user?.uid;
  final role = profileState.profile != null ? (profileState.profile!['role'] as String?) : null;

  return AuthInfo(authenticated: authenticated, uid: uid, role: role);
});

// Provide a GoRouter that uses Riverpod for redirects
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(
      // Simple stream that updates when authInfoProvider changes
      Stream<void>.periodic(const Duration(seconds: 1), (_) {}),
    ),
    routes: [
      GoRoute(
        name: 'welcome',
        path: '/',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        name: 'teacher',
        path: '/teacher',
        builder: (context, state) => const TeacherDashboard(),
      ),
      GoRoute(
        name: 'student',
        path: '/student',
        builder: (context, state) => const StudentDashboard(),
      ),
    ],
    redirect: (context, state) {
      final auth = ref.read(authInfoProvider);

      final loggingIn = state.location == '/login' || state.location == '/signup' || state.location == '/';

      // If not authenticated and trying to access protected routes -> go to welcome
      if (!auth.authenticated && (state.location == '/teacher' || state.location == '/student')) {
        return '/';
      }

      // If authenticated and at welcome/login/signup, redirect to dashboard by role (if available)
      if (auth.authenticated && loggingIn) {
        // If role known, go to role dashboard
        if (auth.role == 'teacher') return '/teacher';
        if (auth.role == 'student') return '/student';
        // role unknown: try to stay on welcome to let profile load; fallback to welcome
        return '/';
      }

      // If authenticated but role doesn't match route, redirect to correct dashboard
      if (auth.authenticated && state.location == '/teacher' && auth.role != 'teacher') {
        if (auth.role == 'student') return '/student';
        return '/';
      }
      if (auth.authenticated && state.location == '/student' && auth.role != 'student') {
        if (auth.role == 'teacher') return '/teacher';
        return '/';
      }

      return null;
    },
  );
});
