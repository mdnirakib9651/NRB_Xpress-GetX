import 'package:flutter/material.dart';

import '../../utils/color_resources.dart';
import '../../utils/lato_styles.dart';

// ignore: camel_case_types, must_be_immutable
class iconText extends StatelessWidget {

  IconData icon;
  String? title;
  iconText({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: (){},
            icon: Icon(icon, color: Colors.grey)),
        SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Text(title!, style: latoRegular.copyWith(fontSize: 20, color: ColorResources.fontGrey, fontWeight: FontWeight.normal,),)),
      ],
    );
  }
}