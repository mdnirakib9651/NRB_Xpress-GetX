import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/data/controller/orderController.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/dimensions.dart';
import 'package:merchant/utils/lato_styles.dart';

// ignore: camel_case_types
class newOrderDeshBoard extends StatefulWidget {
  const newOrderDeshBoard({Key? key}) : super(key: key);

  @override
  State<newOrderDeshBoard> createState() => _newOrderDeshBoardState();
}

// ignore: camel_case_types
class _newOrderDeshBoardState extends State<newOrderDeshBoard> {

  GlobalKey formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(OrderController());
    Get.find<OrderController>().getOrderListData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        init: OrderController(),
        builder: (object){
          return Scaffold(
            appBar: AppBar(
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
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Form(
                    key: formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "FROM",
                                hintStyle: latoRegular.copyWith(fontSize: 18, color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                                suffixIcon: const Icon(Icons.perm_contact_cal_outlined),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "To",
                                hintStyle: latoRegular.copyWith(fontSize: 18, color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                                suffixIcon: const Icon(Icons.perm_contact_cal_outlined),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8,),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: ColorResources.colorPrimaryRider,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Icon(Icons.search, color: Colors.white,),
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
                          Text("SENDER", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                          Text("RECEIVER", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                          Text("STATUS", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 210,
                    width: MediaQuery.of(context).size.width,
                    child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overScroll){
                        overScroll.disallowIndicator();
                        return true;
                      },
                      child: ListView.builder(
                          itemCount: object.orderListController.length,
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
                                        Text("${object.orderListController[index].senderId}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 8,),
                                        Text("${object.orderListController[index].senderAddress}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                        const SizedBox(height: 5,),
                                        Text("${object.orderListController[index].sendercash}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                        const SizedBox(height: 5,),
                                        Text("${object.orderListController[index].senderparcel}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${object.orderListController[index].receiverName}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 8,),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width / 3.2,
                                            child: Text("${object.orderListController[index].receiverAddress}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),)),
                                        // SizedBox(height: 5,),
                                        // Text("Bazar Road", style: LatoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT),),
                                        const SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            const Icon(Icons.add_call, color: Colors.grey, size: 20,),
                                            Text("${object.orderListController[index].receiverPhone}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${object.orderListController[index].senderDate}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                        const SizedBox(height: 8,),
                                        Text("${object.orderListController[index].receiverDate}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                                        const SizedBox(height: 5,),
                                        Container(
                                          height: 35,
                                          width: MediaQuery.of(context).size.width / 5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                            color: ColorResources.colorPrimaryRider,
                                          ),
                                          child: const Center(child: Text("Pending", style: TextStyle(color: Colors.white),)),
                                        )
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
          );
        });
  }
}
