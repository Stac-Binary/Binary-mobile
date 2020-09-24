import 'package:flutter/material.dart';

import 'body.dart';

class DogRegisterSecond extends StatelessWidget {
  final String id;
  DogRegisterSecond(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(id),
    );
  }
}
