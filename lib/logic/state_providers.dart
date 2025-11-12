import 'package:gmail_clone/routes/imports.dart';
import 'package:hooks_riverpod/legacy.dart';

final obscureProvider = StateProvider<bool>((ref) {
  return false;
});