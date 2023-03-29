import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/lato_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'accounting tabbar/handed_over.dart';
import 'accounting tabbar/not_handed_over.dart';
import 'accounting tabbar/pending.dart';

class Accounting extends StatefulWidget {
  const Accounting({Key? key}) : super(key: key);

  @override
  State<Accounting> createState() => _AccountingState();
}

class _AccountingState extends State<Accounting> {

  @override
  void initState() {

    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  Tab(child: Text("Not Hand Over", style: latoRegular.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),),
                  Tab(child: Text("Padding", style: latoRegular.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),),
                  Tab(child: Text("Handed Over", style: latoRegular.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),),
                ]),
             const Expanded(
                child: TabBarView(
                  children: [
                    NotHandOver(),
                    PaddingList(),
                    Handed_Over(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
