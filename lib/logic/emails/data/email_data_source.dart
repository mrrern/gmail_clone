import 'dart:convert';
import 'package:flutter/services.dart';

/// Data source for email data
/// Responsible for loading raw data from assets
class EmailDataSource {
  /// Loads email data from JSON asset file
  Future<List<Map<String, dynamic>>> loadEmailsJson() async {
    final response = await rootBundle.loadString('asset/data.json');
    final List<dynamic> data = json.decode(response);
    return data.cast<Map<String, dynamic>>();
  }
}
