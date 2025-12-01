import 'package:gmail_clone/logic/emails/data/email_data_source.dart';
import 'package:gmail_clone/logic/emails/model/email_model.dart';

/// Repository for email data
/// Acts as a gateway between data sources and the application
/// Converts raw JSON data into type-safe EmailModel entities
class EmailRepository {
  EmailRepository(this._dataSource);

  final EmailDataSource _dataSource;

  /// Fetches all emails from the data source
  Future<List<EmailModel>> fetchEmails() async {
    final jsonData = await _dataSource.loadEmailsJson();
    return jsonData.map((json) => EmailModel.fromJson(json)).toList();
  }

  /// Gets a specific email by ID
  Future<EmailModel?> getEmailById(int id) async {
    final emails = await fetchEmails();
    try {
      return emails.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }
}
