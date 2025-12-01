import 'package:gmail_clone/logic/emails/model/email_model.dart';

/// Extensions for EmailModel domain logic
extension EmailModelX on EmailModel {
  /// Marks this email as read
  EmailModel markAsRead() => copyWith(isRead: true);

  /// Marks this email as unread
  EmailModel markAsUnread() => copyWith(isRead: false);
}

/// Extensions for List<EmailModel> operations
extension EmailListX on List<EmailModel> {
  /// Returns only unread emails
  List<EmailModel> get unreadOnly => where((e) => !e.isRead).toList();

  /// Returns only read emails
  List<EmailModel> get readOnly => where((e) => e.isRead).toList();

  /// Returns emails sorted by date (newest first)
  List<EmailModel> sortedByDate() =>
      [...this]..sort((a, b) => b.date.compareTo(a.date));
}
