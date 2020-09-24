import 'package:flutter/material.dart';

import 'body.dart';

class DogRegisterFirst extends StatelessWidget {
  final String id;
  DogRegisterFirst(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(id),
    );
  }
}
