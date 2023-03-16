import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/register_controller.dart';
import 'package:merchant/utils/color_resources.dart';

class CustomDrwer extends StatefulWidget {
  const CustomDrwer({Key? key}) : super(key: key);

  @override
  State<CustomDrwer> createState() => _CustomDrwerState();
}

class _CustomDrwerState extends State<CustomDrwer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(RegisterController());
  }
  String dashboardDrawer = "";
  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
        builder: (object){
        return Drawer(
            child: ListView(
              children: [
                Container(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  color: ColorResources.colorPrimary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          "https://everydaypower.com/wp-content/uploads/2020/04/50-Classy-Gentleman-Quotes-to-Help-You-Earn-Respect-1000x600.jpg",
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(object.nameItem.value,style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(object.emailItem.value,style: const TextStyle(fontSize: 14, color: Colors.white),
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
                      leading: Icon(Icons.dashboard,size: 28,color: dashboardDrawer=="Dashboard" ? ColorResources.colorPrimary: Colors.grey),
                      title: Text(
                        "Dashboard", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Dashboard" ? ColorResources.colorPrimary: Colors.black ,fontWeight: FontWeight.bold),
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
                      leading: Icon(Icons.calculate,size: 28,color: dashboardDrawer=="Accounting" ? ColorResources.colorPrimary: Colors.grey),
                      title: Text(
                        "Accounting", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Accounting" ? ColorResources.colorPrimary: Colors.black , fontWeight: FontWeight.bold),
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
                      leading: Icon(Icons.account_circle,size: 28,color: dashboardDrawer=="Profile" ? ColorResources.colorPrimary: Colors.grey),
                      title: Text(
                        "Profile", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Profile" ? ColorResources.colorPrimary: Colors.black , fontWeight: FontWeight.bold),
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
                      leading: Icon(Icons.paste,size: 28,color: dashboardDrawer=="Attendance" ? ColorResources.colorPrimary: Colors.grey),
                      title: Text(
                        "Attendance", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Attendance" ? ColorResources.colorPrimary: Colors.black , fontWeight: FontWeight.bold),
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
                      leading: Icon(Icons.traffic,size: 28,color: dashboardDrawer=="Traffic View" ? ColorResources.colorPrimary: Colors.grey),
                      title: Text(
                        "Traffic View", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Traffic View" ? ColorResources.colorPrimary: Colors.black , fontWeight: FontWeight.bold),
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
                      leading: Icon(Icons.settings,size: 28,color: dashboardDrawer=="Settings" ? ColorResources.colorPrimary: Colors.grey),
                      title: Text(
                        "Settings", style: TextStyle(
                          fontSize: 16, color: dashboardDrawer=="Settings" ? ColorResources.colorPrimary: Colors.black , fontWeight: FontWeight.bold),
                      ),
                    ),),
                ),

              ],
            ));
        });
  }
}