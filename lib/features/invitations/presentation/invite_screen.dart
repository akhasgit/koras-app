import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/errors/app_error.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/koras_button.dart';
import '../data/invitations_repository.dart';

/// Accept an organization invitation. Deep-link target `koras://invite/<token>`.
/// See 06.
class InviteScreen extends HookConsumerWidget {
  const InviteScreen({super.key, required this.token});
  final String token;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);
    final error = useState<String?>(null);
    final signedIn = ref.watch(currentProfileProvider).valueOrNull != null;

    Future<void> accept() async {
      loading.value = true;
      error.value = null;
      try {
        await ref.read(invitationsRepositoryProvider).accept(token);
        ref.invalidate(currentProfileProvider);
        if (context.mounted) context.go('/app/dashboard');
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
        Text('You\'ve been invited',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        if (!signedIn)
          const Text('Sign in or create an account to accept this invitation.')
        else
          const Text('Accept this invitation to join the organization.'),
        if (error.value != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(error.value!),
          ),
        const SizedBox(height: 16),
        if (signedIn)
          KorasButton.primary(
            loading: loading.value,
            onPressed: loading.value ? null : accept,
            child: const Text('Accept invitation'),
          )
        else
          KorasButton.primary(
            onPressed: () => context.go('/auth/login?next=/auth/invite/$token'),
            child: const Text('Sign in to continue'),
          ),
      ],
    );
  }
}
