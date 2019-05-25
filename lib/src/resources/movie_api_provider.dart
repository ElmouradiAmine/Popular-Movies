import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_bloc/src/models/item_model.dart';

class MovieApiProvider {
  final _apiKey = 'deeef0ecc72fc1fcec753f04bcca529a';
  Future<ItemModel> fetchMovieList() async {
    print('Fetching...');
    final http.Response response = await http
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");

    print(response.body.toString());
    if (response.statusCode == 200) {
      //If the call tot the server was successful
      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
