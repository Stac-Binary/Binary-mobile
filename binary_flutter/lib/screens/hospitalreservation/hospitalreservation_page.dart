import 'package:flutter/material.dart';

class HospitalreservationPage extends StatefulWidget {
  @override
  _HospitalreservationPageState createState() =>
      _HospitalreservationPageState();
}

class _HospitalreservationPageState extends State<HospitalreservationPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("병원예약"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
