import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/video.dart';

// ignore: constant_identifier_names
const API_KEY = "AIzaSyCVUuqM-rpdUT7hmtVj3e32vYyFo_KraRQ";

class Api {
  Future<List<Video>> search(String search) async {
    http.Response response = await http.get(Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"));

    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<Video> videos = decoded["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      throw Exception("Falha ao carregar");
    }
  }
}
