import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static String get supabaseUrl => dotenv.get('SUPABASE_URL');

  static String get anonKey => dotenv.get('SUPABASE_ANON_KEY');

  static Future<void> initializeSupabase() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: anonKey);
  }
}
