import 'dart:convert';

import 'package:peliculas_app/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;


class PeliculasProvider{
  String _apiKey = 'db4bb48e91bffb95b42f810a475fb4fd';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Pelicula>> _procesarResp(Uri url) async{
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _language,
    });

    return await _procesarResp(url);    
  }

  Future<List<Pelicula>> getPopulares() async {

    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _language,
    });

    return await _procesarResp(url);
  }
}