import 'dart:convert';

import 'package:binary_flutter/models/main_model.dart';
import 'package:http/http.dart' as http;

final client = http.Client();
final baseUrl = "http://10.80.161.119:8000/api";

Future<MainModel> fetchMain(String userId) async {
  try {
    final response = await client.get("$baseUrl/main?userId=$userId",
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      print(response.body);
      return MainModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  } catch (e) {
    throw Exception("Server connection failed");
  }
}
