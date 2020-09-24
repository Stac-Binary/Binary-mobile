import 'package:flutter/cupertino.dart';

class MainModel {
  final String message;
  final MainData data;

  MainModel({this.message, this.data});

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
        message: json["message"],
        data: MainData.fromJson(json["data"]),
      );
}

class MainData {
  final List<MainBloodData> mbd;
  final List<MainListData> mld;

  MainData({@required this.mbd, @required this.mld});

  factory MainData.fromJson(Map<String, dynamic> json) {
    print(json);
    (json["list"] as List).forEach((element) {print("MEAL : ${element["service"]}"); });
    return MainData(
      mld: (json["list"] as List)
          .map((e) => MainListData.fromJson(e))
          .toList(),
      mbd: (json["blist"] as List)
          .map((e) => MainBloodData.fromJson(e))
          .toList(),
    );
  }
}

class MainListData {
  final int idx;
  final String userId;
  final int hospitalIdx;
  final String service;
  final String day;

  MainListData(
      {this.idx, this.userId, this.hospitalIdx, this.service, this.day});

  factory MainListData.fromJson(Map<String, dynamic> json) => MainListData(
        idx: json["idx"],
        userId: json["userId"],
        hospitalIdx: json["hospitalIdx"],
        service: json["service"],
        day: json["day"],
      );
}

class MainBloodData {
  final int idx;
  final String userId;
  final int bhospitalIdx;
  final String bloodType;
  final String time;
  final String day;

  MainBloodData(
      {this.idx,
      this.userId,
      this.bhospitalIdx,
      this.bloodType,
      this.time,
      this.day});

  factory MainBloodData.fromJson(Map<String, dynamic> json) => MainBloodData(
        idx: json["idx"],
        userId: json["userId"],
        bhospitalIdx: json["bhospitalIdx"],
        bloodType: json["bloodType"],
        time: json["time"],
        day: json["date"],
      );
}
