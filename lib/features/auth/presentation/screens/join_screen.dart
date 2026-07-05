import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/email_password_form.dart';
import '../widgets/oauth_buttons.dart';

class JoinScreen extends ConsumerWidget {
  const JoinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Create your account',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        const EmailPasswordForm(mode: AuthMode.signUp),
        const SizedBox(height: 24),
        const OAuthButtons(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            TextButton(
              onPressed: () => context.go('/auth/login'),
              child: const Text('Sign in'),
            ),
          ],
        ),
      ],
    );
  }
}
