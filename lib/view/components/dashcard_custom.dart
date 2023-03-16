import 'package:flutter/material.dart';

import '../../utils/lato_styles.dart';

class DashCustom extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const DashCustom({Key? key,required this.icon,required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: latoRegular.copyWith(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                const SizedBox(height: 10,),
                Text("TOTAL SHIPPING COST", style: latoRegular.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
