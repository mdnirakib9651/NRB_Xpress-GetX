
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('hh:mm aa').format(isoStringToLocalDate(dateTime));
  }
  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String localDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime.toUtc());
  }

  // static String localDateToIsoString(DateTime dateTime) {
  //   return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  // }

  // static String convertTimeToTime(String time) {
  //   return DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(time));
  // }

  static String dateToDateTime(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

  static DateTime convertStringToDate(String dateTime) {
    return DateFormat("yyyy-MM-dd").parse(dateTime);
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }

  static String convertTimeToTime(String time) {
    return DateFormat('hh:mm aa').format(DateFormat('mm:ss.SSS').parse(time));
  }

  static String converttTimeToTime(String time) {
    return DateFormat('MM/yyyy').format(DateFormat('yyyy-MM-dd').parse(time));
  }

  // static String convertTime(String date) {
  //   final DateTime now = DateTime.now();
  //   var localDate = DateTime.parse(date).toLocal();
  //   var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  //   var inputDate = inputFormat.parse(localDate.toString());
  //    inputDate.subtract(const Duration(hours: -6));
  //   print('----------------------_>>>>>>>${inputDate}');
  //   return inputFormat.format(now);
  // }


  static String getFormattedDate(String date) {
    var localDate = DateTime.parse(date).toLocal();
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('HH:mm');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }


 static String getTimeDifferenceFromNow(String date) {
  // DateTime tempDate = DateFormat("yyyy-MM-dd HH:mm").parse(dateTime);
   var localDate = DateTime.parse(date).toLocal();
   var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
   var inputDate = inputFormat.parse(localDate.toString());
    Duration difference = DateTime.now().difference(inputDate);
    if (difference.inSeconds < 5) {
      return "Just now";
    } else if (difference.inMinutes < 1) {
      return "${difference.inSeconds}second ago";
    } else if (difference.inHours < 1) {
      return "${difference.inMinutes}minutes ago";
    } else if (difference.inHours < 24) {
      if((difference.inHours).round() > 1){
        return "${(difference.inHours).round()}hours ago";
      }else{
        return "${(difference.inHours).round()}hour ago";
      }
    } else if (difference.inDays < 30) {
      if((difference.inDays).round() > 1){
        return "${(difference.inDays).round()}days ago";
      }else{
        return "${(difference.inDays).round()}day ago";
      }
    } else if (difference.inDays >= 30 && difference.inDays <= 365) {
      if((difference.inDays/30).round() > 1){
        return "${(difference.inDays/30).round()}months ago";
      }else{
        return "${(difference.inDays/30).round()}month ago";
      }
    } else {
      if((difference.inDays/365).round() > 1){
        return "${(difference.inDays/365).round()}years ago";
      }else{
        return "${(difference.inDays/365).round()}year ago";
      }
    }
  }


  static String getTimeDifferenceNow(String date) {
    var localDate = DateTime.parse(date).toLocal();
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());
    final minusSixHours = inputDate.subtract(const Duration(hours: -6));
    Duration difference = DateTime.now().difference(minusSixHours);
    if (difference.inSeconds < 5) {
      return "Just now";
    } else if (difference.inMinutes < 1) {
      return "${difference.inSeconds} second ago";
    } else if (difference.inHours < 1) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      if((difference.inHours).round() > 1){
        return "${(difference.inHours).round()} hours ago";
      }else{
        return "${(difference.inHours).round()} hour ago";
      }
    } else if (difference.inDays < 30) {
      if((difference.inDays).round() > 1){
        return "${(difference.inDays).round()} days ago";
      }else{
        return "${(difference.inDays).round()} day ago";
      }
    } else if (difference.inDays >= 30 && difference.inDays <= 365) {
      if((difference.inDays/30).round() > 1){
        return "${(difference.inDays/30).round()} months ago";
      }else{
        return "${(difference.inDays/30).round()} month ago";
      }
    } else {
      if((difference.inDays/365).round() > 1){
        return "${(difference.inDays/365).round()} years ago";
      }else{
        return "${(difference.inDays/365).round()} year ago";
      }
    }
  }


  static String? convertViews(String currentBalance) {
    try{
      int value = int.parse(currentBalance);
      if(value > 999 && value < 1000000){
        return '${(value/1000).toStringAsFixed(1)}k'; // convert to K for number from > 1000 < 1 million
      }else if(value > 1000000){
        return '${(value/1000000).toStringAsFixed(1)}M'; // convert to M for number from > 1 million
      }else if(value < 900){
        return value.toString(); // if value < 1000, nothing to do
      }
    }catch(e){
      debugPrint("$e");
    }
    return '';
  }

}


