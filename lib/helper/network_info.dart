// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class NetworkInfo {
//   final Connectivity? connectivity;
//   NetworkInfo(this.connectivity);
//
//   Future<bool> get isConnected async {
//     ConnectivityResult _result = await connectivity!.checkConnectivity();
//     return _result != ConnectivityResult.none;
//   }
//
//   static void checkConnectivity(BuildContext context) {
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       bool notConnect = result == ConnectivityResult.none;
//       Fluttertoast.showToast(
//         msg: notConnect ? 'You are currently offline' : 'Now you are connected',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 3,
//         backgroundColor: Colors.black.withOpacity(0.5),
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     });
//   }
// }
