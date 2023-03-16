import 'package:flutter/material.dart';
import 'package:merchant/utils/color_resources.dart';
import 'package:merchant/utils/dimensions.dart';
import 'package:merchant/utils/images.dart';
import 'package:merchant/utils/lato_styles.dart';

class DefaultViewScreen extends StatefulWidget {
  const DefaultViewScreen({Key? key}) : super(key: key);

  @override
  State<DefaultViewScreen> createState() => _DefaultViewScreenState();
}

class _DefaultViewScreenState extends State<DefaultViewScreen> {

  String? dividionChoose;
  List divisionItem = [
    "Select",
    "PickedUp",
    "DroppedOff",
    "Transferred",
    "On Hold",
    "Delivered",
    "Went for delivery",
    "Returned",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("  Order status: ", style: latoRegular.copyWith(color: Colors.black, fontSize: 16),),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: DropdownButton(
                          hint: const Text(
                            "Select",
                            style: TextStyle(
                                fontSize: Dimensions.fontSizeDefault,
                                color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black26,
                          ),
                          iconSize: 30,
                          isExpanded: true,
                          underline: const SizedBox(),
                          style: const TextStyle(
                              fontSize: Dimensions.fontSizeDefault,
                              color: Colors.black),
                          value: dividionChoose,
                          onChanged: (value) {
                            setState(() {
                              dividionChoose = value as String?;
                            });
                          },
                          items: divisionItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("SENDER INFORMATION", style: latoBold.copyWith(fontWeight: FontWeight.bold, color: ColorResources.colorPrimaryRider, fontSize: 20),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 155,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Haji Textile", style: latoRegular.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    Text("Address: House-10 Mirpu-11, Farmgate, Dhaka-1215", style: latoRegular.copyWith(fontSize: 16, color: Colors.black,),),
                    const SizedBox(height: 15,),
                    Container(
                      height: 68,
                      width: MediaQuery.of(context).size.width / 1.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorResources.colorPrimaryRider,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: 65,
                                width: 65,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Image.asset(Images.telePhone1, color: ColorResources.colorPrimaryRider),
                                )),
                          ),
                          const SizedBox(width: 10,),
                          Text("01723102030", style: latoBold.copyWith(fontSize: 20, color: Colors.white),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("RECEIVER INFORMATION", style: latoBold.copyWith(fontWeight: FontWeight.bold, color: ColorResources.colorPrimaryRider, fontSize: 20),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 155,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nuri Nuri", style: latoRegular.copyWith(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    Text("House-6, Road-7, Mirpur-11, Pallabi, Dhaka-1216", style: latoRegular.copyWith(fontSize: 16, color: Colors.black,),),
                    const SizedBox(height: 15,),
                    Container(
                      height: 68,
                      width: MediaQuery.of(context).size.width / 1.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorResources.colorPrimaryRider,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                                height: 65,
                                width: 65,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Image.asset(Images.telePhone1, color: ColorResources.colorPrimaryRider),
                                )),
                          ),
                          const SizedBox(width: 10,),
                          Text("0196210103", style: latoBold.copyWith(fontSize: 20, color: Colors.white),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("ORDER DETAILS", style: latoBold.copyWith(fontWeight: FontWeight.bold, color: ColorResources.colorPrimaryRider, fontSize: 20),),
            ),
          ),
        ],
      ),
    );
  }
}
