import 'dart:convert';
import 'package:app_anime_info/util/anime.dart';
import "package:http/http.dart" as http;

class ConsumerApi {
  var response, url, body;

  Anime anime = Anime();
  Future<List> getAllDataAnimes(int numPage) async {
    url = Uri.parse("https://api.jikan.moe/v3/genre/anime/$numPage");
    response = await http.get(url);
    body = json.decode(response.body);

    return anime.getAnimes(body);
  }

  Future<List> getAllDataTopAnimes(int numPage) async {
    url = Uri.parse("https://api.jikan.moe/v3/top/anime/$numPage");
    response = await http.get(url);
    body = json.decode(response.body);

    return anime.getAnimesTop(body);
  }

  Future<List> getAllDataTopMangas(int numPage) async {
    url = Uri.parse("https://api.jikan.moe/v3/top/manga/$numPage");
    response = await http.get(url);
    body = json.decode(response.body);

    return anime.getAnimesTop(body);
  }
}
