import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/errors/app_error.dart';
import '../../../../shared/widgets/koras_button.dart';
import '../../../../shared/widgets/koras_text_field.dart';
import '../../data/auth_repository.dart';
import '../widgets/email_password_form.dart';

class ResetPasswordScreen extends HookConsumerWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = useTextEditingController();
    final loading = useState(false);
    final error = useState<String?>(null);

    Future<void> submit() async {
      final problem = passwordValidator(password.text);
      if (problem != null) {
        error.value = problem;
        return;
      }
      loading.value = true;
      error.value = null;
      try {
        await ref.read(authRepositoryProvider).updatePassword(password.text);
        if (context.mounted) context.go('/app/dashboard');
      } catch (e) {
        error.value = errorToMessage(mapError(e));
      } finally {
        if (context.mounted) loading.value = false;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Set a new password',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        KorasTextField(
          controller: password,
          label: 'New password',
          obscure: true,
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
          child: const Text('Update password'),
        ),
      ],
    );
  }
}
