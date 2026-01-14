import 'package:supabase_flutter/supabase_flutter.dart';

class ChatRepository {
  final _supabase = Supabase.instance.client;
  // Persisting the future as local variable to prevent refetching upon rebuilds.

  SupabaseStreamFilterBuilder get stream => _supabase.from('conversation_id=eq.1').stream(primaryKey: ['id']);
}