class UserModel {
  final String message;
  final UserData data;
  UserModel({this.message, this.data});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        data: UserData.fromJson(json["data"]["user"]),
      );
}

class UserData {
  final String id;
  final String pw;
  final String name;
  final String address;
  UserData({this.id, this.pw, this.name, this.address});
  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
      id: json["id"],
      pw: json["pw"],
      name: json["name"],
      address: json["address"]);
}
