class HospitalModel {
  final String message;
  final List<HospitalData> data;
  HospitalModel({this.message, this.data});
  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
        message: json["message"],
        data: (json["data"]["hospitals"] as List)
            .map((e) => HospitalData.fromJson(e))
            .toList(),
      );
}

class HospitalData {
  final int idx;
  final String hospitalName;
  final String address;
  HospitalData({this.idx, this.hospitalName, this.address});
  factory HospitalData.fromJson(Map<String, dynamic> json) => HospitalData(
        idx: json["idx"],
        hospitalName: json["hospitalName"],
        address: json["address"],
      );
}
