extension SplitCapitalizeExtension on String{
  String get splitCapitalize{
    final parts = trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    final initials = parts.map((e) {
      if (e.isEmpty) return '';
      return e[0].toUpperCase();
    }).join('');
    return initials;

  }




}