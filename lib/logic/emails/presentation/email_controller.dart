import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gmail_clone/logic/emails/data/email_providers.dart';
import 'package:gmail_clone/logic/emails/model/email_model.dart';
import 'package:gmail_clone/logic/emails/model/email_extensions.dart';

part 'email_controller.g.dart';

/// Controller for managing the email list state
/// Uses AsyncNotifier for async state management
@riverpod
class EmailList extends _$EmailList {
  @override
  Future<List<EmailModel>> build() async {
    final repository = ref.read(emailRepositoryProvider);
    final emails = await repository.fetchEmails();
    return emails.sortedByDate();
  }

  /// Refreshes the email list from the data source
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(emailRepositoryProvider);
      final emails = await repository.fetchEmails();
      return emails.sortedByDate();
    });
  }

  /// Marks an email as read (optimistic update)
  Future<void> markAsRead(int emailId) async {
    state.whenData((emails) {
      final updated = emails
          .map((e) => e.id == emailId ? e.markAsRead() : e)
          .toList();
      state = AsyncValue.data(updated);
    });
  }

  /// Marks an email as unread (optimistic update)
  Future<void> markAsUnread(int emailId) async {
    state.whenData((emails) {
      final updated = emails
          .map((e) => e.id == emailId ? e.markAsUnread() : e)
          .toList();
      state = AsyncValue.data(updated);
    });
  }
}

/// Provider for fetching a specific email by ID
@riverpod
Future<EmailModel?> emailById(EmailByIdRef ref, int id) async {
  final repository = ref.read(emailRepositoryProvider);
  return repository.getEmailById(id);
}
