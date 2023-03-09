import 'dart:convert';

import 'package:bloc_statemanagement/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<PostModel>> getPost(int start) async {
    List<PostModel> postList = [];
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=20"));

    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);
      for (int i = 0; i < jsonString.length; i++) {
        var data = PostModel.fromJson(jsonString[i]);
        postList.add(data);
      }
      print("data is called");
      return postList;
    }

    return [];
  }
}
