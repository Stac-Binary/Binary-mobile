import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/provider/dog_provider.dart';
import 'package:binary_flutter/screens/blooddonation/blood_donation_page.dart';
import 'package:binary_flutter/screens/bloodrequest/bloodrequest_page.dart';
import 'package:binary_flutter/screens/bloodtrace/bloodtrace_page.dart';
import 'package:binary_flutter/screens/home/home_page.dart';
import 'package:binary_flutter/screens/hospitalreservation/hospitalreservation_page.dart';
import 'package:binary_flutter/screens/profileedit/profileedit_page.dart';
import 'package:binary_flutter/screens/reservation/reservation_page.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/sizes/sizeConfig.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final pageController = PageController(initialPage: 2);
  List titles = [
    'a',
    'b',
    'c',
    'd',
  ];

  int _currentTabIndex = 2;

  final List<Widget> _children = [
    ReservationPage(),
    BloodrequestPage(),
    HomePage(),
    HospitalreservationPage(),
    BloodTracePage()
  ];

  @override
  void initState() {
    super.initState();
    // init the TabController
  }

  void onPageChanged(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  void _onTap(int index) {
    setState(() {
      _currentTabIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
    //pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DogProvider>(context, listen: false);
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: kLightBlack,
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Text(
          provider.dogs[provider.selected].dogName,
          style: TextStyle(
            color: Color(0xFF707070),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/colde.jpg"),
                backgroundColor: kWhite,
              ),
              accountName: Text(
                "박상아",
                style: kNanumExtraBold.copyWith(fontSize: 20),
              ),
              accountEmail: Text(
                "minseocho0309@gmail.com",
                style: kNanumBold.copyWith(fontSize: 16),
              ),
              onDetailsPressed: () {
                print("clicked");
              },
              decoration: BoxDecoration(
                color: kPink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: kPink,
              ),
              title: Text('프로필 수정'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileEditPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.home,
                color: kPink,
              ),
              title: Text('헌혈 내역'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BloodDonationPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.home,
                color: kPink,
              ),
              title: Text('헌혈 혜택'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.home,
                color: kPink,
              ),
              title: Text('앱정보'),
              onTap: () {},
            ),
            Divider(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        items: _Tab.values
            .map(
              (_Tab tab) => BottomNavigationBarItem(
                title: Text("필요없는 타이틀"),
                icon: Image.asset(_getAssetForTab(tab),
                    width: getProportionateScreenWidth(24),
                    height: getProportionateScreenHeight(24)),
              ),
            )
            .toList(),
      ),
      backgroundColor: kWhite,
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: _children,
        physics: NeverScrollableScrollPhysics(), // No sliding
      ),
    );
  }

  String _getAssetForTab(_Tab tab) {
    final active = tab == _Tab.values[_currentTabIndex];

    if (tab == _Tab.calendar) {
      return active
          ? 'assets/images/calendarred.png'
          : 'assets/images/calendar.png';
    } else if (tab == _Tab.blood) {
      return active ? 'assets/images/bloodred.png' : 'assets/images/blood.png';
    } else if (tab == _Tab.home) {
      return active ? 'assets/images/homered.png' : 'assets/images/home.png';
    } else if (tab == _Tab.health) {
      return active
          ? 'assets/images/healthred.png'
          : 'assets/images/health.png';
    }
    return active
        ? 'assets/images/locationred.png'
        : 'assets/images/location.png';
  }
}

enum _Tab { calendar, blood, home, health, location }
