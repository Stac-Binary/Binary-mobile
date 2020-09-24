import 'dart:convert';

import 'package:binary_flutter/models/dogs_model.dart';
import 'package:http/http.dart' as http;

final client = http.Client();
final baseUrl = "http://10.80.161.119:8000/api";
Future<List<DogData>> getDogs(String id) async {
  try {
    print("ASDF");
    final response = await client.get('$baseUrl/dog?userId=$id');
    print(response.body);
    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return (decoded["data"]["doglist"] as List)
          .map((e) => DogData.fromJson(e))
          .toList();
    } else
      List.empty();
  } on Exception {
    throw Exception("Server connection failed");
  }
}

Future<DogModel> fetchDogs(String id, String dogname, String breed,
    String weight, double bloodType) async {
  try {
    final response = await client.post("$baseUrl/dog/",
        body: json.encode({
          "id": id,
          "dogName": dogname,
          "breed": breed,
          "weight": weight,
          "bloodType": bloodType
        }),
        headers: {"Content-Type": "application/json"});
    print("$id $dogname $breed $weight $bloodType");
    print(response.body);
    if (response.statusCode == 200) {
      return DogModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    throw Exception("Server connection failed");
  }
}
