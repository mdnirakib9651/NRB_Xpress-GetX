import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../data/controller/billing_controller.dart';
import '../../../../../utils/color_resources.dart';
import '../../../../../utils/dimensions.dart';
import '../../../../../utils/lato_styles.dart';
class Billing extends StatefulWidget {
  const Billing({Key? key}) : super(key: key);

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(BillingController());
    Get.find<BillingController>().getBillingList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BillingController(),
        builder: (object){
        return Scaffold(
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
            backgroundColor: ColorResources.colorPrimary,
            title: Text("BILLING", style: latoRegular.copyWith(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          backgroundColor: ColorResources.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
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
                        Text("ORDER INFO", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                        Text("RECEIVER", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                        Text("STATUS", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 245,
                  width: MediaQuery.of(context).size.width,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll){
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: ListView.builder(
                        itemCount: object.billingList.length,
                        itemBuilder: (BuildContext context, int index){
                          return Card(
                            color: Colors.grey[100],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${object.billingList[index].orderId}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 8,),
                                      Text("COD: ${object.billingList[index].orderCOD}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                      const SizedBox(height: 5,),
                                      Text("Xpress Fee: ${object.billingList[index].orderXpress}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                      const SizedBox(height: 5,),
                                      Text("Paid Amount: ${object.billingList[index].orderPaid}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${object.billingList[index].receiverName}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 8,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.add_call, color: Colors.grey, size: 20,),
                                          Text("${object.billingList[index].receiverPhone}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                        ],
                                      ),
                                      Text("${object.billingList[index].receiverCash}", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: ColorResources.colorPrimary,
                                        ),
                                        child: const Center(child: Text("Unpaid", style: TextStyle(color: Colors.white),)),
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
