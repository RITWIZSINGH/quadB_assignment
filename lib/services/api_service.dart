import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/show_model.dart';

class ApiService {
  static const baseUrl = 'https://api.tvmaze.com';

  static Future<List<Show>> searchShows(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/shows?q=$query')
    );

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => Show.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }
}