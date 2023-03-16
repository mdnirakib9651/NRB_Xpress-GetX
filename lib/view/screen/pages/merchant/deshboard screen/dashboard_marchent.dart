import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/model/request/menu_repository.dart';
import '../../../../../data/model/response/menu_model.dart';
import '../../../../../utils/color_resources.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/lato_styles.dart';
import '../drawer/drawer.dart';
import '../menu screen/changepassword.dart';
import '../menu screen/logout.dart';

class DashBoardMarchantScreen extends StatefulWidget {
  const DashBoardMarchantScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardMarchantScreen> createState() => _DashBoardMarchantScreenState();
}

class _DashBoardMarchantScreenState extends State<DashBoardMarchantScreen> {

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
    value: item,
    child: Text("${item.text}", style: latoRegular.copyWith(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),),
  );

  void onSelected(BuildContext context, MenuItem item){
    switch (item){
      case MenuItems.changepassword:
        Get.to(const ChangePassword());
        break;
      case MenuItems.logout:
        Get.to(const LogOut());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrwer(),
      appBar: AppBar(
        backgroundColor: ColorResources.colorPrimary,
        title: const Text("DASHBOARD",),
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                ...MenuItems.itemlist.map((buildItem))
              ]),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: Row(
                  children: [
                    Image.asset(Images.sales, height: 80, width: 80,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BDT 6945.0", style: latoRegular.copyWith(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                        const SizedBox(height: 10,),
                        Text("TOTAL SALES", style: latoRegular.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: Row(
                  children: [
                    Image.asset(Images.bankNote, height: 80, width: 80,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BDT 1060.0", style: latoRegular.copyWith(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                        const SizedBox(height: 10,),
                        Text("TOTAL SHIPPING COST", style: latoRegular.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: Row(
                  children: [
                    Image.asset(Images.order, height: 80, width: 80,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("75", style: latoRegular.copyWith(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                        const SizedBox(height: 10,),
                        Text("TOTAL NUMBER OF ORDERS", style: latoRegular.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                child: Row(
                  children: [
                    Image.asset(Images.delivered, height: 80, width: 80,),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("10", style: latoRegular.copyWith(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                        const SizedBox(height: 10,),
                        Text("TOTAL DELIVERED ORDERS", style: latoRegular.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

