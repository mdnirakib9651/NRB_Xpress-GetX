import 'package:flutter/material.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/view/screen/pages/rider/accounting/accounting.dart';
import 'package:merchant/view/screen/pages/rider/new%20order/new_order.dart';
import '../attendance/attendance.dart';
import '../dashboard_rider_screen/dashboard_rider_screen.dart';

class RiderDeshboard extends StatefulWidget {
  const RiderDeshboard({Key? key}) : super(key: key);

  @override
  State<RiderDeshboard> createState() => _RiderDeshboardState();
}

class _RiderDeshboardState extends State<RiderDeshboard> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const DashBoardRiderScreen(),
    const NewOrder(),
    const Accounting(),
    const Attendance(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined,),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vignette_outlined, ),
            label: 'New Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined, ),
            label: 'Accounting',

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_timeline_outlined,
            ),
            label: 'Attendance',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorResources.colorPrimaryRider,
        onTap: _onItemTapped,
      ),

    );
  }
}
