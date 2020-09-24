import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/models/hospital_model.dart';
import 'package:binary_flutter/provider/dog_provider.dart';
import 'package:binary_flutter/provider/login_provider.dart';
import 'package:binary_flutter/screens/bloodrequest/complete/register_complete.dart';
import 'package:binary_flutter/services/network/fetch_hospital.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../services/sizes/sizeConfig.dart';
import 'body.dart';

class BloodGlobal {
  static int selectedIdx;
  static String when;
  static String time;
  static HospitalData model;
}

class BloodrequestPage extends StatefulWidget {
  @override
  _BloodrequestPageState createState() => _BloodrequestPageState();
}

class _BloodrequestPageState extends State<BloodrequestPage>
    with SingleTickerProviderStateMixin {
  List<Widget> pages;
  PageController controller;
  @override
  void initState() {
    controller = PageController();
    pages = [
      Body(controller),
      RequestBlood(controller),
      RequestBloodLaster(controller),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: pages,
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class RequestBloodLaster extends StatefulWidget {
  PageController controller;
  RequestBloodLaster(this.controller);
  @override
  _RequestBloodLasterState createState() => _RequestBloodLasterState();
}

class _RequestBloodLasterState extends State<RequestBloodLaster> {
  TimeOfDay firstTime, secondTime;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<DogProvider>(
      builder: (ctx, item, _) => Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(20)),
              child: Text(
                "헌혈 신청",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF707070)),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x10000000),
                      offset: Offset(0, 0),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        BloodGlobal.model.hospitalName,
                        style: TextStyle(
                          color: Color(0xFF707070),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            BloodGlobal.model.address,
                            style: TextStyle(
                              color: Color(0x77707070),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "053-0000-0000",
                            style: TextStyle(
                              color: Color(0x77707070),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/blood_icon.svg",
                            width: getProportionateScreenWidth(40),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(20)),
                            child: Text(
                              "DEA ${item.dogs[item.selected].bloodType}",
                              style: TextStyle(
                                color: Color(0xFFDE5B5B),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/colde.jpg"),
                            radius: getProportionateScreenWidth(25),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(20)),
                            child: Text(
                              "${item.dogs[item.selected].dogName}",
                              style: TextStyle(
                                color: Color(0xFF707070),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Checkbox(
                                value: selected,
                                onChanged: (val) {
                                  setState(() {
                                    selected = val;
                                  });
                                },
                                checkColor: Colors.black,
                                tristate: false,
                                activeColor: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(12)),
                              child: Text("헌혈에 동의합니다."),
                            )
                          ],
                        ),
                      ),
                      RoundedButton(
                        press: selected
                            ? () async {
                                final response = await fetchDogs(
                                    Provider.of<LoginProvider>(context,
                                            listen: false)
                                        .model
                                        .data
                                        .id,
                                    BloodGlobal.selectedIdx.toString(),
                                    item.dogs[item.selected].bloodType,
                                    BloodGlobal.time,
                                    BloodGlobal.when);

                                print(response);
                                if (response == 200)
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              FinishBloodRequest()));
                              }
                            : null,
                        text: "신청하기",
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RequestBlood extends StatefulWidget {
  PageController controller;
  RequestBlood(this.controller);
  @override
  _RequestBloodState createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
  TimeOfDay firstTime, secondTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(20)),
            child: Text(
              "헌혈 신청",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF707070)),
            ),
          ),
          Container(
            width: double.infinity,
            height: getProportionateScreenHeight(340),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0x10000000),
                  offset: Offset(0, 0),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "원하는 시간대를 입력해주세요",
                  style: TextStyle(
                    color: Color(0xFF707070),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClockSelect((time) {
                          BloodGlobal.time = DateFormat("kk:mm").format(
                              DateTime(
                                  2020, 1, 1, time.hour, time.minute, 1, 1, 1));
                          secondTime = time;
                        }),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Expanded(
                        flex: 3,
                        child: DateSelect(
                          (time) {
                            BloodGlobal.when =
                                DateFormat("yyyy.MM.dd").format(time);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: RoundedButton(
                    press: () {
                      widget.controller.jumpToPage(2);
                    },
                    text: "다음",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DateSelect extends StatefulWidget {
  final Function callback;
  DateSelect(this.callback);
  @override
  _DateSelectState createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  String date;
  @override
  void initState() {
    date = DateFormat("yyyy년 MM월 dd일").format(DateTime.now());
    widget.callback(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay time = TimeOfDay.now();
        showDatePicker(
          firstDate: DateTime.now(),
          initialDate: DateTime.now(),
          context: context,
          lastDate: DateTime.now().add(Duration(days: 365)),
        ).then(
          (selected) => selected == null
              ? null
              : setState(() {
                  this.date = DateFormat("yyyy년 MM월 dd일").format(selected);
                  widget.callback(selected);
                }),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFAEAEAE),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(5),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFCCCCCC),
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  color: Color(0xFFFF8181),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClockSelect extends StatefulWidget {
  final Function callback;
  ClockSelect(this.callback);
  @override
  _ClockSelectState createState() => _ClockSelectState();
}

class _ClockSelectState extends State<ClockSelect> {
  String time;
  @override
  void initState() {
    time = DateFormat("kk : mm").format(DateTime.now());
    widget.callback(TimeOfDay.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay time = TimeOfDay.now();
        showTimePicker(
          initialTime: time,
          context: context,
        ).then(
          (selected) => selected == null
              ? null
              : setState(() {
                  this.time = DateFormat("kk : mm").format(DateTime(
                      2020, 1, 1, selected.hour, selected.minute, 1, 1, 1));
                  widget.callback(selected);
                }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFAEAEAE),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(5),
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFCCCCCC),
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
