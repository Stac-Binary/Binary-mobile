import 'dart:convert';

import 'package:http/http.dart' as http;

final client = http.Client();
final baseUrl = "http://10.80.161.119:8000/api";

Future<int> fetchRegister(
    String id, String pw, String name, String address) async {
  try {
    final response = await client.post("$baseUrl/auth/register",
        body: json.encode({
          "id": id,
          "pw": pw,
          "name": name,
          "address": address,
        }),
        headers: {"Content-Type": "application/json"});
    print("$id $pw $name $address");
    print(response.body);
    return response.statusCode;
  } catch (e) {
    throw Exception("Server connection failed");
  }
}
