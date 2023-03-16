import 'package:flutter/material.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/dimensions.dart';
import 'package:merchant/utils/lato_styles.dart';

// ignore: camel_case_types
class Handed_Over extends StatefulWidget {
  const Handed_Over({Key? key}) : super(key: key);

  @override
  State<Handed_Over> createState() => _Handed_OverState();
}

// ignore: camel_case_types
class _Handed_OverState extends State<Handed_Over> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
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
                      Text("ORDER INFO", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                      Text("RECEIVER", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                      Text("STATUS", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                width: MediaQuery.of(context).size.width,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overScroll){
                    overScroll.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                      itemCount: 10,
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
                                    Text("1233434232", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 8,),
                                    Text("COD: 0", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                    const SizedBox(height: 5,),
                                    Text("Xpress Fee: 200", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                    const SizedBox(height: 5,),
                                    Text("Paid Amount: 0", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Rakibul Hasan", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.black, fontWeight: FontWeight.bold),),
                                    const SizedBox(height: 8,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.add_call, color: Colors.grey, size: 20,),
                                        Text("3435345455", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                      ],
                                    ),
                                    Text("Cash on PickUp", style: latoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: ColorResources.colorPrimaryRider,
                                      ),
                                      child: const Center(child: Text("Handed Over", style: TextStyle(color: Colors.white),)),
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
              ),
            ),

          ],
        ),
      ),
    );
  }
}
