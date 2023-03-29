import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/auth_controller.dart';
import 'package:merchant/data/model/request/menu_repository.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/images.dart';
import 'package:merchant/utils/lato_styles.dart';
import 'package:merchant/view/screen/pages/merchant/menu%20screen/changepassword.dart';
import '../../../../../data/model/response/menu_model.dart';
import '../../../../../utils/dimensions.dart';
import '../../merchant/logIn/login.dart';
import '../rider drawer/rider_drawer.dart';
import 'new order deshboard/neworder_deshboard.dart';

class DashBoardRiderScreen extends StatefulWidget {
  const DashBoardRiderScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardRiderScreen> createState() => _DashBoardRiderScreenState();
}

class _DashBoardRiderScreenState extends State<DashBoardRiderScreen> {

  AuthController authController = Get.find<AuthController>();
  @override
  void initState() {
    // TODO: implement initState
    authController.getdashBoardData();
    authController.getLocation();
    String? token= authController.getToken();
    debugPrint("Share Preference Token: $token");
    super.initState();
    Get.find<AuthController>().getRiderDetails();
  }
  _showMyDialog(){
    showDialog(context: context, builder: (context)
    => AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Confirm Logout",style: TextStyle(fontSize:Dimensions.fontSizeExtraLarge,color: ColorResources.colorBlue)),
          const SizedBox(height: 10,),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: ColorResources.grey,
          )
        ],
      ),
      content: const Text("Are you sure want to logout?", style: TextStyle(fontSize:Dimensions.fontSizeLarge,color: ColorResources.black)),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: (){
                  Get.back();
                },
                child: Container(
                  height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, color: ColorResources.lightSkyBlue)
                    ),
                    child: const Center(child: Text("Cancel",style: TextStyle(fontSize: 18,color: ColorResources.colorBlue))))),
            const SizedBox(width: 10,),
            InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: (){
                  setState(() {
                    authController.logOut(latitude: authController.getCurrentPosition!.latitude, longitude: authController.getCurrentPosition!.longitude, address: authController.currentAddress.toString()).then((value){
                      if(value.isSuccess){
                        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LogInHere(isMerchant: false,)), (route) => true);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInHere(isMerchant: false,)));
                        EasyLoading.showSuccess(value.message);
                      } else{
                        EasyLoading.showSuccess(value.message);
                      }
                    });
                  });
                },
                child: Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorResources.colorBlue
                    ),
                    child: const Center(child: Text("Log Out",style: TextStyle(fontSize: 18,color: ColorResources.white))))),
            const SizedBox(width: 10,)
          ],
        ),
        const SizedBox(height: 10,)
      ],
      backgroundColor: ColorResources.white,
    ));
  }

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
        _showMyDialog();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.colorPrimaryRider,
        actions: [
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onPressed: (){},
              icon: const Icon(Icons.search, color: Colors.white,)),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onPressed: (){},
              icon: const Icon(Icons.notifications_active, color: Colors.white,)),
          PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                ...MenuItems.itemlist.map((buildItem))
              ]),

        ],
      ),
      drawer: const RiderDrawer(),
      body: GetBuilder<AuthController>(
        builder: (auth){
          return auth.dashboardData != null ?
          Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      Get.to(()=> const newOrderDeshBoard());
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset(Images.giftBox, fit: BoxFit.fill, height: 100, width: 100, color: ColorResources.colorPrimaryRider,),
                            const SizedBox(width: 20,),
                            Container(
                              height: 100,
                              width: 1,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 10,),
                            Text("New Orders: ${auth.dashboardData?.newOrder}", style: latoRegular.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Get.to(()=> const newOrderDeshBoard());
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset(Images.giftBox, fit: BoxFit.fill, height: 100, width: 100, color: ColorResources.colorPrimaryRider,),
                            const SizedBox(width: 20,),
                            Container(
                              height: 100,
                              width: 1,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 10,),
                            Text("Active Orders: 1", style: latoRegular.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Get.to(()=> const newOrderDeshBoard());
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset(Images.giftBox, fit: BoxFit.fill, height: 100, width: 100, color: ColorResources.colorPrimaryRider,),
                            const SizedBox(width: 20,),
                            Container(
                              height: 100,
                              width: 1,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 10,),
                            Text("Delivered Orders: 8", style: latoRegular.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ) : const Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}
