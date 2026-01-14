import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const supabaseUrl = '';
  static const anonKey = '';
  static Future<void> initializeSupabase() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: anonKey);
  }
}
