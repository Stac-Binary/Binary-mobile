import 'package:binary_flutter/models/dogs_model.dart';
import 'package:binary_flutter/services/network/fetch_dogs.dart';
import 'package:flutter/material.dart';

enum DogStatus { loading, end, error, zero }

class DogProvider extends ChangeNotifier {
  int _selected = 0;
  int get selected => _selected;
  set selected(val) {
    _selected = val;
    notifyListeners();
  }

  DogStatus _status = DogStatus.loading;
  DogStatus get status => _status;
  List<DogData> dogs = [];
  set status(val) {
    _status = val;
    notifyListeners();
  }

  loadingDogs(String id) async {
    status = DogStatus.loading;
    try {
      final response = await getDogs(id);
      if (response.length > 0) {
        dogs = response;
        status = DogStatus.end;
      } else {
        if (response == null)
          status = DogStatus.error;
        else
          status = DogStatus.zero;
      }
    } on Exception {
      throw Exception("ERROR TO CONNECT SERVER");
    }
  }
}
