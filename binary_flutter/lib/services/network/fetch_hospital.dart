import 'dart:convert';

import 'package:binary_flutter/models/hospital_model.dart';
import 'package:http/http.dart' as http;

final client = http.Client();
final baseUrl = "http://10.80.161.119:8000/api";

Future<int> fetchAddHospital(
    String uid, String hid, String service, String day) async {
  try {
    final response = await client.post("$baseUrl/reserve/",
        body: json.encode({
          "userId": uid,
          "hospitalIdx": hid,
          "service": service,
          "day": day,
        }),
        headers: {"Content-Type": "application/json"});
    return response.statusCode;
  } catch (e) {
    throw Exception("Server connection failed");
  }
}

Future<HospitalModel> fetchHospital(String name) async {
  try {
    final response = await client.get("$baseUrl/hospital?keyword=$name",
        headers: {"Content-Type": "application/json"});

    print(response.body);
    if (response.statusCode == 200) {
      return HospitalModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  } catch (e) {
    throw Exception("Server connection failed");
  }
}

Future<int> fetchDogs(String userId, String dogIdx, String bhospitalIdx,
    String bloodType, String time, String date) async {
  try {
    final response = await client.post("$baseUrl/breserve/",
        body: json.encode({
          "userId": userId,
          "dogIdx": dogIdx,
          "bhospitalIdx": bhospitalIdx,
          "bloodType": bloodType,
          "time": time,
          "date": date,
        }),
        headers: {"Content-Type": "application/json"});
    return response.statusCode;
  } on Exception {}
}
