import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/providers.dart';
import '../../../..//theme.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = appThemeFor(Theme.of(context).brightness);
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(),
            Text('Welcome', style: theme.textTheme.displayMedium),
            const SizedBox(height: 12),
            Text('Choose an option to continue', style: theme.textTheme.bodyMedium),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.go('/signup'),
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => context.go('/login'),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
