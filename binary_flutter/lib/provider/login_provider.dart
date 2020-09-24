import 'package:binary_flutter/models/user_model.dart';
import 'package:binary_flutter/services/network/fetch_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status { unauth, auth, loading }

class LoginProvider extends ChangeNotifier {
  Status _status = Status.unauth;
  Status get status => _status;
  UserModel _model;
  set status(Status val) {
    _status = val;
    notifyListeners();
  }

  LoginProvider() {
    loading();
  }

  loading() async {
    status = Status.loading;
    print("OK");
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("OK");
    final id = pref.get("id");
    final pw = pref.get("pw");
    final name = pref.get("name");
    final address = pref.get("address");
    print(id);
    _model = UserModel(
        message: "Auto logged",
        data: UserData(id: id, pw: pw, name: name, address: address));
    if (id != null)
      status = Status.auth;
    else
      status = Status.unauth;
  }

  UserModel get model => _model;
  Future<void> signIn(String id, String pw) async {
    try {
      status = Status.loading;

      final response = await fetchLogin(id, pw);
      if (response != null) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        print(response.data.id);
        pref.setString("id", response.data.id);
        pref.setString("pw", response.data.pw);
        pref.setString("name", response.data.name);
        pref.setString("address", response.data.address);
        _model = response;
        status = Status.auth;
      } else
        status = Status.unauth;
    } on Exception {}
  }
}
