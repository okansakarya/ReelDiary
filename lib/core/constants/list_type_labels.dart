/// API list_type değerlerinin Türkçe etiket karşılıkları.
class ListTypeLabels {
  ListTypeLabels._();

  static const Map<String, String> _apiToTurkish = {
    'popular': 'Popüler',
    'now_playing': 'Vizyondakiler',
    'top_rated': 'En iyi puanlı',
    'upcoming': 'Yakında',
  };

  /// [apiValue] için Türkçe etiket döndürür; tanımsızsa [apiValue] döner.
  static String toTurkish(String apiValue) {
    final key = apiValue.toLowerCase();
    return _apiToTurkish[key] ?? apiValue;
  }
}
