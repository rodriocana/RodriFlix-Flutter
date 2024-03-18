import 'dart:convert';

import 'package:flutflix/constant.dart';
import 'package:flutflix/modelos/pelicula.dart';
import 'package:http/http.dart'
    as http; //  para referenciar este paquete usando http

class api {
  static const trending_url =
      'https://api.themoviedb.org/3/trending/movie/day?language=es-ES?page=1&api_key=${constants.api_key}'; // aqui le paso la api key como constante para reducir codigo

  Future<List<pelicula>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trending_url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List; // guarda en una lista todo los resultados del json
      print(decodedData);// imprimir por pantalla los datos json
      return decodedData.map((peli) => pelicula.fromJson(peli)).toList();
      
    } else {
      throw Exception('Errorrrr');
    } // si es 200 es que todo es correcto, si es 101 es malo
  }
}
