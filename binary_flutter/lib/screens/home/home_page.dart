import 'package:binary_flutter/constants/constants.dart';
import 'package:binary_flutter/screens/home/body.dart';
import 'package:binary_flutter/services/sizes/sizeConfig.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabController _tabController;

  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // init the TabController
    // _tabController = TabController(length: _Tab.values.length, vsync: null);
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
          // _tabController.animateTo(index);
        },
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
      body: HomeBody(),
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
    } else if (tab == _Tab.health){
      return active ? 'assets/images/healthred.png' : 'assets/images/health.png';
    }
      return active
          ? 'assets/images/locationred.png'
          : 'assets/images/location.png';
  }
}

enum _Tab { calendar, blood, home, health, location }
