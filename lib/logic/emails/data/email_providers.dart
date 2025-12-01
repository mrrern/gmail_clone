import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gmail_clone/logic/emails/data/email_data_source.dart';
import 'package:gmail_clone/logic/emails/data/email_repository.dart';

part 'email_providers.g.dart';

/// Provider for EmailDataSource
@riverpod
EmailDataSource emailDataSource(EmailDataSourceRef ref) {
  return EmailDataSource();
}

/// Provider for EmailRepository
@riverpod
EmailRepository emailRepository(EmailRepositoryRef ref) {
  return EmailRepository(ref.watch(emailDataSourceProvider));
}
