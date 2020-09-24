import 'package:flutter/material.dart';

import 'body.dart';

class DogRegisterThird extends StatelessWidget {
  final String name;
  final String breed;
  final String weight;
  final String dea;
  DogRegisterThird({this.name, this.breed, this.weight, this.dea});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(name: name, breed: breed, weight: weight, dea: dea),
    );
  }
}
