// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:merchant/data/controller/account%20order%20controller/account%20order%20controller.dart';
import 'package:merchant/data/controller/account%20order%20controller/check_controller.dart';
import 'package:merchant/data/controller/rider%20controller/padding_controller.dart';
import 'package:merchant/data/model/response/rider%20model/check_box_state.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/dimensions.dart';
import 'package:merchant/utils/lato_styles.dart';

class PaddingList extends StatefulWidget {

  const PaddingList({Key? key}) : super(key: key);

  @override
  State<PaddingList> createState() => _PaddingListState();
}

class _PaddingListState extends State<PaddingList> {

  AccountOrderController accountOrderController = Get.find<AccountOrderController>();
  bool allSelect = false;
  bool _isPressed = false;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.put(PaddingController());
      Get.find<PaddingController>().getPaddingListControll();
      accountOrderController.dateWiseSearch("pending");
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    CheckController checkBox = Get.find<CheckController>();
    return GetBuilder<AccountOrderController>(
      // init: NotHandOverController(),
        builder: (order){
          return Scaffold(
            backgroundColor: ColorResources.backgroundColor,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              order.chooseFromDate(context);
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
                                    Text("${order.fromDate}", style: latoRegular.copyWith(fontSize: 18, color: Colors.grey,),),
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
                                    Text("${order.toDate}", style: latoRegular.copyWith(fontSize: 18, color: Colors.grey,),),
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
                            order.dateWiseSearch("not_yet_handed_over");
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
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
                            Text("SENDER", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                            Text("RECEIVER", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                            Text("STATUS", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<AccountOrderController>(
                    builder: (orderController){
                      return orderController.accountsOrderList != null ?
                      LazyLoadScrollView(
                          onEndOfPage: orderController.loadNextPage,
                          isLoading: orderController.lastPage,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height - 330,
                              width: MediaQuery.of(context).size.width,
                              child: NotificationListener<OverscrollIndicatorNotification>(
                                onNotification: (overScroll){
                                  overScroll.disallowIndicator();
                                  return true;
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: orderController.accountsOrderList.length,
                                          itemBuilder: (BuildContext context, int index){
                                            return GestureDetector(
                                              onLongPressStart: (_){
                                                Future.delayed(const Duration(seconds: 1), () {
                                                  setState(() {
                                                    _isPressed = true;
                                                  });
                                                });
                                              },
                                              child: _isPressed
                                                  ? Card(
                                                color: Colors.grey[100],
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Checkbox(
                                                        value: orderController.isSelected![index],
                                                        activeColor: ColorResources.colorPrimaryRider,
                                                        onChanged: (value){
                                                          setState(() {
                                                            orderController.isSelected![index] = value;
                                                            CheckModel check = CheckModel(orderController.accountsOrderList[index], 1);
                                                            CheckController checkController = Get.find<CheckController>();
                                                            if(checkController.isCheck(check)){
                                                              checkController.removeFromCheck(check);
                                                              // ScaffoldMessenger.of(context).showSnackBar(snackBar("Removed From Check"));
                                                            } else{
                                                              checkController.addToCheck(check);
                                                              // ScaffoldMessenger.of(context).showSnackBar(snackBar("Added To Favourite"));
                                                            }
                                                          });
                                                        }),
                                                    SizedBox(
                                                      // color: Colors.blue,
                                                      width: Get.width/3.8,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("${orderController.accountsOrderList[index].id}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                                            const SizedBox(height: 8,),
                                                            Text(orderController.accountsOrderList[index].sender, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                                            const SizedBox(height: 5,),
                                                            Text(orderController.accountsOrderList[index].senderAddress, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                                            const SizedBox(height: 5,),
                                                            Text(orderController.accountsOrderList[index].paymentMethod, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      // color: Colors.red,
                                                      width: Get.width/3.4,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(orderController.accountsOrderList[index].recieverName, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                                            const SizedBox(height: 5,),
                                                            Text(orderController.accountsOrderList[index].receiverAddress, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                const Icon(Icons.add_call, color: Colors.grey, size: 20,),
                                                                Text(orderController.accountsOrderList[index].recieverPhone, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5,),
                                                            Text("Item Type : ${orderController.accountsOrderList[index].shipmentItemType}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                                            RichText(
                                                              text: TextSpan(
                                                                children: <TextSpan>[
                                                                  TextSpan(text: "Amount: ", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Colors.black)),
                                                                  TextSpan(text: "${orderController.accountsOrderList[index].amount}", style: latoRegular.copyWith( color: Colors.black, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.bold)),
                                                                  TextSpan(text: " Tk", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Colors.black)),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const SizedBox(height: 5,),
                                                          Text(orderController.accountsOrderList[index].date, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                                          const SizedBox(height: 5,),
                                                          Container(
                                                            height: 35,
                                                            width: 80,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(3),
                                                              color: ColorResources.colorPrimaryRider,
                                                            ),
                                                            child: const Center(child: Text("Hand Over", style: TextStyle(color: Colors.white),)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                                  : Card(
                                                color: Colors.grey[100],
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width/3.2,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("${orderController.accountsOrderList[index].id}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                                            const SizedBox(height: 8,),
                                                            Text(orderController.accountsOrderList[index].sender, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                                            const SizedBox(height: 5,),
                                                            Text(orderController.accountsOrderList[index].senderAddress, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                                            const SizedBox(height: 5,),
                                                            Text(orderController.accountsOrderList[index].paymentMethod, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width/3.2,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(orderController.accountsOrderList[index].recieverName, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                                            const SizedBox(height: 5,),
                                                            Text(orderController.accountsOrderList[index].receiverAddress, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault, overflow: TextOverflow.ellipsis), maxLines: 2,),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                const Icon(Icons.add_call, color: Colors.grey, size: 20,),
                                                                Text(orderController.accountsOrderList[index].recieverPhone, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 5,),
                                                            Text("Item Type : ${orderController.accountsOrderList[index].shipmentItemType}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                                            RichText(
                                                              text: TextSpan(
                                                                children: <TextSpan>[
                                                                  TextSpan(text: "Amount: ", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Colors.black)),
                                                                  TextSpan(text: "${orderController.accountsOrderList[index].amount}", style: latoRegular.copyWith( color: Colors.black, fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.bold)),
                                                                  TextSpan(text: " Tk", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeSmall,  color: Colors.black)),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          const SizedBox(height: 5,),
                                                          Text(orderController.accountsOrderList[index].date, style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                                          const SizedBox(height: 5,),
                                                          Container(
                                                            height: 35,
                                                            width: 80,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(3),
                                                              color: ColorResources.colorPrimaryRider,
                                                            ),
                                                            child: const Center(child: Text("Hand Over", style: TextStyle(color: Colors.white),)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                    ),
                                    checkBox.checkList.isNotEmpty ?
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("Amount : ", style: latoBold.copyWith(fontWeight: FontWeight.bold, color: ColorResources.black, fontSize: 20),),
                                              Text("${checkBox.amount}", style: latoBold.copyWith(color: ColorResources.black, fontSize: 16, ),),
                                            ],
                                          ),
                                          const SizedBox(height: 5,),
                                          Container(
                                            height: 40,
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                                color: ColorResources.colorPrimaryRider,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Center(child: Text("Delete ${checkBox.checkList.length}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorResources.white),)),
                                          ),
                                        ],
                                      ),
                                    ) : const SizedBox()
                                  ],
                                ),
                              ),
                            ),
                          )
                      ): const Center(child: CircularProgressIndicator(),);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
