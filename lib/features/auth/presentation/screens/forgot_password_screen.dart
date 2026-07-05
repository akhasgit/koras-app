import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/errors/app_error.dart';
import '../../../../shared/widgets/koras_button.dart';
import '../../../../shared/widgets/koras_text_field.dart';
import '../../data/auth_repository.dart';
import '../widgets/email_password_form.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = useTextEditingController();
    final loading = useState(false);
    final sent = useState(false);
    final error = useState<String?>(null);

    Future<void> submit() async {
      final problem = emailValidator(email.text);
      if (problem != null) {
        error.value = problem;
        return;
      }
      loading.value = true;
      error.value = null;
      try {
        await ref.read(authRepositoryProvider).resetPassword(email.text.trim());
        sent.value = true;
      } catch (e) {
        error.value = errorToMessage(mapError(e));
      } finally {
        if (context.mounted) loading.value = false;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Reset password', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        if (sent.value)
          const Text('Check your email for a reset link.')
        else ...[
          KorasTextField(
            controller: email,
            label: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          if (error.value != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(error.value!),
            ),
          const SizedBox(height: 16),
          KorasButton.primary(
            loading: loading.value,
            onPressed: loading.value ? null : submit,
            child: const Text('Send reset link'),
          ),
        ],
        const SizedBox(height: 12),
        TextButton(
          onPressed: () => context.go('/auth/login'),
          child: const Text('Back to sign in'),
        ),
      ],
    );
  }
}
