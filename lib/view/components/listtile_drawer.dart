// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../utils/color_resources.dart';

class ListTileDrawer extends StatefulWidget {
  String? title;
  Function onTab;
  IconData icon;
  ListTileDrawer({Key? key,required this.title,required this.icon,required this.onTab}) : super(key: key);

  @override
  State<ListTileDrawer> createState() => _ListTileDrawerState();
}

class _ListTileDrawerState extends State<ListTileDrawer> {

  String dashboardDrawer="";
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        setState(() {
          dashboardDrawer = "${widget.title}";
          Navigator.push(context, MaterialPageRoute(builder: (context) => widget.onTab()));
        });
      },
      child: Container(
        decoration:  BoxDecoration(
          color: dashboardDrawer == "${widget.title}" ? ColorResources.backgroundColor: Colors.white,),
        child: ListTile(
          leading: Icon(widget.icon,size: 28,color: dashboardDrawer=="${widget.title}" ? ColorResources.colorPrimary: Colors.grey),
          title: Text(
            "${widget.title}", style: TextStyle(
              fontSize: 16, color: dashboardDrawer=="${widget.title}" ? ColorResources.colorPrimary: Colors.black , fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
