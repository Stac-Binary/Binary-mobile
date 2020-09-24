import 'dart:convert';

import 'package:binary_flutter/models/user_model.dart';
import 'package:http/http.dart' as http;

final client = http.Client();
final baseUrl = "http://10.80.161.119:8000/api";

Future<UserModel> fetchLogin(String id, String pw) async {
  try {
    final response = await client.post("$baseUrl/auth/login",
        body: json.encode({
          "id": id,
          "pw": pw,
        }),
        headers: {"Content-Type": "application/json"});
    print("$id $pw");
    print(response.body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  } catch (e) {
    throw Exception("Server connection failed");
  }
}
