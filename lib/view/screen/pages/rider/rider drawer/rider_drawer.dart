import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/auth_controller.dart';
import 'package:merchant/utils/color_resources.dart';

import '../../../../../utils/dimensions.dart';
import '../../merchant/logIn/login.dart';

class RiderDrawer extends StatefulWidget {
  const RiderDrawer({Key? key}) : super(key: key);

  @override
  State<RiderDrawer> createState() => _RiderDrawerState();
}

class _RiderDrawerState extends State<RiderDrawer> {

  // RegisterController registerController = Get.put(RegisterController());
  String dashboardDrawer="";
  AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
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
      content: const Text("Are you sure want to log out?", style: TextStyle(fontSize:Dimensions.fontSizeLarge,color: ColorResources.black)),
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
                    authController.logOut().then((value){
                      if(value.isSuccess){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LogInHere(isMerchant: false,)), (route) => true);
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: GetBuilder<AuthController>(
          builder: (authController){
            return authController.riderDetailsData != null ?
            ListView(
              children: [
                Container(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  color: ColorResources.colorPrimaryRider,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          authController.riderDetailsData!.avatar,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(authController.riderDetailsData!.firstName,style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(authController.riderDetailsData!.firstName,style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    dashboardDrawer="Dashboard";
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      color: dashboardDrawer=="Dashboard" ? ColorResources.backgroundColor: Colors.white,),
                    child: ListTile(
                      leading: Icon(Icons.dashboard,size: 28,color: dashboardDrawer=="Dashboard" ? ColorResources.colorPrimaryRider: Colors.grey),
                      title: Text(
                        "Dashboard", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Dashboard" ? ColorResources.colorPrimaryRider: Colors.black ,fontWeight: FontWeight.bold),
                      ),
                    ),),
                ),


                InkWell(
                  onTap: () {
                    dashboardDrawer="Accounting";
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      color: dashboardDrawer=="Accounting" ? ColorResources.backgroundColor: Colors.white,),
                    child: ListTile(
                      leading: Icon(Icons.calculate,size: 28,color: dashboardDrawer=="Accounting" ? ColorResources.colorPrimaryRider: Colors.grey),
                      title: Text(
                        "Accounting", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Accounting" ? ColorResources.colorPrimaryRider: Colors.black , fontWeight: FontWeight.bold),
                      ),
                    ),),
                ),

                InkWell(
                  onTap: () {
                    dashboardDrawer="Profile";
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      color: dashboardDrawer=="Profile" ? ColorResources.backgroundColor: Colors.white,),
                    child: ListTile(
                      leading: Icon(Icons.account_circle,size: 28,color: dashboardDrawer=="Profile" ? ColorResources.colorPrimaryRider: Colors.grey),
                      title: Text(
                        "Profile", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Profile" ? ColorResources.colorPrimaryRider: Colors.black , fontWeight: FontWeight.bold),
                      ),
                    ),),
                ),

                InkWell(
                  onTap: () {
                    dashboardDrawer="Attendance";
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      color: dashboardDrawer=="Attendance" ? ColorResources.backgroundColor: Colors.white,),
                    child: ListTile(
                      leading: Icon(Icons.paste,size: 28,color: dashboardDrawer=="Attendance" ? ColorResources.colorPrimaryRider: Colors.grey),
                      title: Text(
                        "Attendance", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Attendance" ? ColorResources.colorPrimaryRider: Colors.black , fontWeight: FontWeight.bold),
                      ),
                    ),),
                ),

                InkWell(
                  onTap: () {
                    dashboardDrawer="Traffic View";
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      color: dashboardDrawer=="Traffic View" ? ColorResources.backgroundColor: Colors.white,),
                    child: ListTile(
                      leading: Icon(Icons.traffic,size: 28,color: dashboardDrawer=="Traffic View" ? ColorResources.colorPrimaryRider: Colors.grey),
                      title: Text(
                        "Traffic View", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Traffic View" ? ColorResources.colorPrimaryRider: Colors.black , fontWeight: FontWeight.bold),
                      ),
                    ),),
                ),

                InkWell(
                  onTap: () {
                    dashboardDrawer="Settings";
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      color: dashboardDrawer=="Settings" ? ColorResources.backgroundColor: Colors.white,),
                    child: ListTile(
                      leading: Icon(Icons.settings,size: 28,color: dashboardDrawer=="Settings" ? ColorResources.colorPrimaryRider: Colors.grey),
                      title: Text(
                        "Settings", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Settings" ? ColorResources.colorPrimaryRider: Colors.black , fontWeight: FontWeight.bold),
                      ),
                    ),),
                ),

                InkWell(
                  onTap: () {
                    dashboardDrawer="logOut";
                    // Get.back();
                    _showMyDialog();
                    setState(() {

                    });
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      color: dashboardDrawer=="logOut" ? ColorResources.backgroundColor: Colors.white,),
                    child: ListTile(
                      leading: Icon(Icons.logout,size: 28,color: dashboardDrawer=="logOut" ? ColorResources.colorPrimaryRider: Colors.grey),
                      title: Text(
                        "Log Out", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="logOut" ? ColorResources.colorPrimaryRider: Colors.black , fontWeight: FontWeight.bold),
                      ),
                    ),),
                ),

              ],
            ) : const Center(child: CircularProgressIndicator(),);
          },
        ));
  }
}