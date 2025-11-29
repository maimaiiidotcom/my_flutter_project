import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/providers.dart';
import '../../../..//theme.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = appThemeFor(Theme.of(context).brightness);
    final userNotifier = ref.read(userAccountNotifierProvider.notifier);
    final profileNotifier = ref.read(profileNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(labelText: 'Full name'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 12),
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([FormBuilderValidators.required(), FormBuilderValidators.email()]),
              ),
              const SizedBox(height: 12),
              FormBuilderTextField(
                name: 'password',
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: FormBuilderValidators.compose([FormBuilderValidators.required(), FormBuilderValidators.minLength(6)]),
              ),
              const SizedBox(height: 12),
              FormBuilderDropdown<String>(
                name: 'role',
                decoration: const InputDecoration(labelText: 'Role'),
                initialValue: 'student',
                items: const [
                  DropdownMenuItem(value: 'teacher', child: Text('Teacher')),
                  DropdownMenuItem(value: 'student', child: Text('Student')),
                ],
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final ok = _formKey.currentState?.saveAndValidate();
                  if (ok == true) {
                    final val = _formKey.currentState!.value;
                    final name = val['name'] as String;
                    final email = val['email'] as String;
                    final password = val['password'] as String;
                    final role = val['role'] as String;

                    // Create account and set profile (repository creates profile in createUser)
                    await userNotifier.createAccount(email, password, {'name': name, 'email': email, 'role': role});

                    final uid = ref.read(userAccountNotifierProvider).user?.uid;
                    if (uid != null) {
                      // ensure profile loaded
                      await profileNotifier.loadProfile(uid);
                      // Navigate to role dashboard
                      if (role == 'teacher') {
                        context.go('/teacher');
                      } else {
                        context.go('/student');
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Account creation failed')));
                    }
                  }
                },
                child: const Text('Create account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
