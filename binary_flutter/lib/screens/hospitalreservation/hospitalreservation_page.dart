import 'package:binary_flutter/components/rounded_button.dart';
import 'package:binary_flutter/components/rounded_input_field.dart';
import 'package:binary_flutter/provider/dog_provider.dart';
import 'package:binary_flutter/provider/login_provider.dart';
import 'package:binary_flutter/screens/bloodrequest/bloodrequest_page.dart';
import 'package:binary_flutter/services/network/fetch_hospital.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../services/sizes/sizeConfig.dart';
import 'body.dart';
import 'complete/hospitalreservation_complete.dart';

class HospitalreservationPage extends StatefulWidget {
  @override
  _HospitalreservationPageState createState() =>
      _HospitalreservationPageState();
}

class _HospitalreservationPageState extends State<HospitalreservationPage>
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
                BloodGlobal.model.hospitalName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF707070)),
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(160),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "예약확인을 위해 회원님의\n정보를 병원에 전송합니다.",
                      style: TextStyle(
                        color: Color(0xFF707070),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(30)),
              child: GestureDetector(
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
                      child: Text("개인정보 이용을 동의합니다."),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(20)),
              child: RoundedButton(
                press: selected
                    ? () async {
                        final response = await fetchAddHospital(
                            Provider.of<LoginProvider>(context, listen: false)
                                .model
                                .data
                                .id,
                            BloodGlobal.model.idx.toString(),
                            BloodGlobal.service,
                            BloodGlobal.when);
                        print(response);
                        if (response == 200)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => FinishBlood(),
                            ),
                          );
                      }
                    : null,
                text: "예약하기",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestBlood extends StatefulWidget {
  PageController controller;
  RequestBlood(this.controller);
  final strs = ["건강검진", "헌혈신청", "예방접종", "미용"];
  @override
  _RequestBloodState createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
  DateTime selected;
  TextEditingController controller;
  int itemsel;

  @override
  void initState() {
    controller = TextEditingController();
    itemsel = 0;
    selected = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(20)),
              child: Text(
                BloodGlobal.model.hospitalName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF707070)),
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(250),
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
                    "필요한 서비스를 선택해주세요",
                    style: TextStyle(
                      color: Color(0xFF707070),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: TileSelect(widget.strs[0], itemsel == 1,
                                    () {
                              setState(() {
                                itemsel = 1;
                              });
                            })),
                            SizedBox(
                              width: getProportionateScreenWidth(20),
                            ),
                            Expanded(
                                child: TileSelect(widget.strs[1], itemsel == 2,
                                    () {
                              setState(() {
                                itemsel = 2;
                              });
                            }))
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TileSelect(widget.strs[2], itemsel == 3,
                                    () {
                              setState(() {
                                itemsel = 3;
                              });
                            })),
                            SizedBox(
                              width: getProportionateScreenWidth(20),
                            ),
                            Expanded(
                                child: TileSelect(widget.strs[3], itemsel == 4,
                                    () {
                              setState(() {
                                itemsel = 4;
                              });
                            }))
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        RoundedTextField2(
                          node: FocusNode()
                            ..addListener(() {
                              setState(() {
                                itemsel = 0;
                              });
                            }),
                          controller: controller,
                          hintText: "직접 입력하기",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(150),
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
                    "원하는 날짜를 선택해주세요.",
                    style: TextStyle(
                      color: Color(0xFF707070),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: DateSelect((a) {
                      selected = a;
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: RoundedButton(
                press: () {
                  BloodGlobal.service =
                      itemsel == 0 ? controller.text : widget.strs[itemsel - 1];
                  widget.controller.jumpToPage(2);
                  BloodGlobal.when = DateFormat("yyyy.MM.dd").format(selected);
                },
                text: "다음",
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TileSelect extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function press;
  TileSelect(this.title, this.isSelected, this.press);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFFFF8181) : Color(0xFFAEAEAE),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Color(0xFFFF8181) : Color(0xFFCCCCCC),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
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
