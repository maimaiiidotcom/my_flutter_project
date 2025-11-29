import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../presentation/providers.dart';

class StudentDashboard extends ConsumerWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);
    final userState = ref.watch(userAccountNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Student Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Join Class / View Materials', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            if (profileState.status == ProfileStatus.loaded && profileState.profile != null)
              Text('Welcome, ${profileState.profile!['name'] ?? userState.user?.email ?? 'Student'}'),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () {}, child: const Text('Join Class')),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () {}, child: const Text('View Materials')),
          ],
        ),
      ),
    );
  }
}
