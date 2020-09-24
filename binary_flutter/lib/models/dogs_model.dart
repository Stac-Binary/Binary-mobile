class DogModel {
  final String message;
  final DogData data;
  DogModel({this.message, this.data});
  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        message: json["message"],
        data: DogData.fromJson(json["data"]),
      );
}

class DogData {
  final int id;
  final String dogName;
  final String breed;
  final String weight;
  final String bloodType;
  DogData({this.id, this.dogName, this.breed, this.weight, this.bloodType});
  factory DogData.fromJson(Map<String, dynamic> json) => DogData(
        id: json["idx"],
        dogName: json["dogName"],
        breed: json["breed"],
        weight: "${json["weight"]}",
        bloodType: "${json["bloodType"]}",
      );
}
