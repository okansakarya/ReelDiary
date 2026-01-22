import 'package:dio/dio.dart';

class MovieService {
  MovieService(String token)
      : _token = token,
        dio = Dio(
          BaseOptions(
            baseUrl: 'https://api.themoviedb.org/3',
            headers: {
              'Authorization': 'Bearer $token',
              'accept': 'application/json',
            },
          ),
        );

  final String _token; // istersen kullanırsın
  final Dio dio;

  Future<Map<String, dynamic>> nowPlaying({int page = 1}) async {
    final res = await dio.get(
      '/movie/now_playing',
      queryParameters: {
        'language': 'tr-TR',
        'region': 'TR',
        'page': page,
      },
    );

    return (res.data as Map).cast<String, dynamic>();
  }
}
