import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/lato_styles.dart';

import 'new order tabItem/defaultview.dart';
import 'new order tabItem/mapview.dart';

class NewOrder extends StatefulWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            onPressed: (){
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white,),
          ),
          elevation: 0,
          backgroundColor: ColorResources.colorPrimaryRider,
          title: Text("ORDER DETAILS", style: latoRegular.copyWith(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        body: Column(
          children: [
            TabBar(
                tabs: [
                  Tab(child: Text("Default View", style: latoRegular.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),),
                  Tab(child: Text("Map View", style: latoRegular.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),),
                ]),
            const Expanded(
                child: TabBarView(
                  children: [
                    DefaultViewScreen(),
                    MapViewScreen(),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
