import 'dart:convert';

import 'package:d5_7_1/models/album_model.dart';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class NetworkService {
  static const baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> result = [];
    Uri uri = Uri.parse("$baseUrl/posts");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List listJson = List.from(jsonDecode(response.body));
      result = listJson.map((json) => PostModel.fromJson(json)).toList();
    }

    return result;
  }

  Future<List<AlbumModel>> getAllAlbums() async {
    List<AlbumModel> result = [];
    Uri uri = Uri.parse("$baseUrl/Albums");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List listJson = List.from(jsonDecode(response.body));
      result = listJson.map((json) => AlbumModel.fromJson(json)).toList();
    }

    return result;
  }
}
