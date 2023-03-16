import 'package:flutter/material.dart';
import '../../../../../utils/color_resources.dart';
import '../../../../../utils/lato_styles.dart';
import '../../../../components/navigationbar_custom.dart';
import '../deshboard screen/billing.dart';
import '../deshboard screen/dashboard_marchent.dart';
import '../deshboard screen/orders.dart';
import '../deshboard screen/profile.dart';
class MerchantDeshBoard extends StatefulWidget {
  const MerchantDeshBoard({Key? key}) : super(key: key);

  @override
  State<MerchantDeshBoard> createState() => _MerchantDeshBoardState();
}

class _MerchantDeshBoardState extends State<MerchantDeshBoard> {
  int index = 0;
  final screens = [
    const DashBoardMarchantScreen(),
    const Orders(),
    const Billing(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: ColorResources.colorPrimary,
            labelTextStyle: MaterialStateProperty.all(latoRegular.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            )),
        child: NavigationBar(
          backgroundColor: const Color(0xFFf1f5fb),
          // animationDuration: Duration(seconds: 2),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationBarCustom(
                icon: Icons.dashboard_outlined,
                selecIcon: Icons.dashboard,
                title: "Dashboard"),
            NavigationBarCustom(
                icon: Icons.gif_box_outlined,
                selecIcon: Icons.gif_box_rounded,
                title: "Orders"),
            NavigationBarCustom(
                icon: Icons.bookmark_add_outlined,
                selecIcon: Icons.bookmark_add,
                title: "Billing"),
            NavigationBarCustom(
                icon: Icons.person_outline,
                selecIcon: Icons.person,
                title: "Profile"),
          ],
        ),
      ),
    );
  }
}