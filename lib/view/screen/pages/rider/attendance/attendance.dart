// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:merchant/data/controller/account%20order%20controller/account%20order%20controller.dart';
import 'package:merchant/data/controller/orderController.dart';
import 'package:merchant/data/controller/rider%20controller/attendance_controller.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/dimensions.dart';
import 'package:merchant/utils/lato_styles.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {

  AccountOrderController accountOrderController = Get.find<AccountOrderController>();
  RiderAttendenceController riderAttendenceController = Get.find<RiderAttendenceController>();
  bool allSelect = false;

  GlobalKey formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      riderAttendenceController.dateWiseSearch("attendances");
    });
    super.initState();
    Get.put(OrderController());
    Get.find<OrderController>().getOrderListData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RiderAttendenceController>(
        // init: OrderController(),
        builder: (riderAttendence){
          return riderAttendence.riderAttendenceList != null
          ? Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: ColorResources.colorPrimaryRider,
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
              title: Text("ORDERS", style: latoRegular.copyWith(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            backgroundColor: ColorResources.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: LazyLoadScrollView(
                onEndOfPage: riderAttendence.loadNextPage,
                isLoading: riderAttendence.lastPage,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                riderAttendence.chooseFromDate(context);
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: ColorResources.white,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${riderAttendence.fromDate}", style: latoRegular.copyWith(fontSize: 18, color: Colors.grey,),),
                                      const Icon(Icons.perm_contact_cal_outlined, color: Colors.grey,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: ColorResources.white,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: const Center(child: Text("To", style: latoBold, )),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: ColorResources.white,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${riderAttendence.toDate}", style: latoRegular.copyWith(fontSize: 18, color: Colors.grey,),),
                                      const Icon(Icons.perm_contact_cal_outlined, color: Colors.grey,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8,),
                          InkWell(
                            onTap: (){
                              riderAttendence.dateWiseSearch("attendances");
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: ColorResources.colorPrimaryRider,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.search, color: Colors.white,),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: ColorResources.backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1),
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                            Text("Check In", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                            Text("Check Out", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 275,
                      width: MediaQuery.of(context).size.width,
                      child: NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overScroll){
                          overScroll.disallowIndicator();
                          return true;
                        },
                        child: ListView.builder(
                            itemCount: riderAttendence.riderAttendenceList.length,
                            itemBuilder: (BuildContext context, int index){
                              return Card(
                                color: Colors.grey[100],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 35,
                                            width: MediaQuery.of(context).size.width / 6,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: ColorResources.colorPrimaryRider,
                                            ),
                                            child: Center(child: Text(riderAttendence.riderAttendenceList[index].date.substring(0, 10).trim(), style: const TextStyle(color: Colors.white),)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(riderAttendence.riderAttendenceList[index].checkinTime, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                          const SizedBox(height: 8,),
                                          SizedBox(
                                              width: MediaQuery.of(context).size.width / 3.4,
                                              child: Text(riderAttendence.riderAttendenceList[index].checkinAddress, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(riderAttendence.riderAttendenceList[index].checkoutTime, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                          const SizedBox(height: 8,),
                                          SizedBox(
                                              width: MediaQuery.of(context).size.width / 3.5,
                                              child: Text(riderAttendence.riderAttendenceList[index].checkinAddress, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ) : const Center(child: CircularProgressIndicator(),);
        });
  }
}
