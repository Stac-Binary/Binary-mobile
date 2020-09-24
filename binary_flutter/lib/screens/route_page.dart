import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/screens/bloodrequest/bloodrequest_page.dart';
import 'package:binary_flutter/screens/bloodtrace/bloodtrace_page.dart';
import 'package:binary_flutter/screens/home/home_page.dart';
import 'package:binary_flutter/screens/hospitalreservation/hospitalreservation_page.dart';
import 'package:binary_flutter/screens/reservation/reservation_page.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final pageController = PageController(initialPage: 2);

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
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
    //pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: kLightBlack,
        ),
        title: Text("풍원이",
            style: kNanumLight.copyWith(fontSize: 20, color: kLightBlack)),
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
