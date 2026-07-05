import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/errors/app_error.dart';
import '../../../../core/theme/koras_theme.dart';
import '../../../../shared/widgets/koras_button.dart';
import '../../../../shared/widgets/koras_text_field.dart';
import '../../data/auth_repository.dart';

enum AuthMode { signIn, signUp }

String? emailValidator(String v) =>
    RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim())
        ? null
        : 'Enter a valid email';

String? passwordValidator(String v) =>
    v.length >= 8 ? null : 'At least 8 characters';

/// Email/password form with hooks-managed loading/error; repository owns I/O.
class EmailPasswordForm extends HookConsumerWidget {
  const EmailPasswordForm({super.key, required this.mode});
  final AuthMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final email = useTextEditingController();
    final password = useTextEditingController();
    final loading = useState(false);
    final error = useState<String?>(null);

    Future<void> submit() async {
      final problem =
          emailValidator(email.text) ?? passwordValidator(password.text);
      if (problem != null) {
        error.value = problem;
        return;
      }
      loading.value = true;
      error.value = null;
      try {
        final repo = ref.read(authRepositoryProvider);
        if (mode == AuthMode.signUp) {
          await repo.signUp(email: email.text.trim(), password: password.text);
        } else {
          await repo.signInWithPassword(
            email: email.text.trim(),
            password: password.text,
          );
        }
      } on AppError catch (e) {
        error.value = errorToMessage(e);
      } catch (e) {
        error.value = errorToMessage(mapError(e));
      } finally {
        if (context.mounted) loading.value = false;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KorasTextField(
          controller: email,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 12),
        KorasTextField(
          controller: password,
          label: 'Password',
          obscure: true,
          onSubmitted: (_) => submit(),
        ),
        if (error.value != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(error.value!, style: TextStyle(color: k.danger)),
          ),
        const SizedBox(height: 16),
        KorasButton.primary(
          loading: loading.value,
          onPressed: loading.value ? null : submit,
          child: Text(mode == AuthMode.signUp ? 'Create account' : 'Sign in'),
        ),
      ],
    );
  }
}
