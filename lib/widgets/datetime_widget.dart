import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  final DateTime dateTime;
  DateTimeWidget(this.dateTime);

  String checkMonth(int number) {
    switch (number) {
      case 1:
        {
          return 'Jan';
        }
        break;

      case 2:
        {
          return 'Feb';
        }
        break;

      case 3:
        {
          return 'Mar';
        }
        break;
      case 4:
        {
          return 'Apr';
        }
        break;
      case 5:
        {
          return 'May';
        }
        break;
      case 6:
        {
          return 'Jun';
        }
        break;
      case 7:
        {
          return 'Jul';
        }
        break;
      case 8:
        {
          return 'Aug';
        }
        break;
      case 9:
        {
          return 'Sep';
        }
        break;
      case 10:
        {
          return 'Oct';
        }
        break;
      case 11:
        {
          return 'Nov';
        }
        break;
      case 12:
        {
          return 'Dec';
        }
        break;
    }
  }

  String checkIsAfternoon(int hour) {
    if (hour >= 12) {
      return "PM";
    } else {
      return "AM";
    }
  }

  int convertTo12h(int hour) {
    if (hour > 12) {
      return hour - 12;
    } else {
      return hour;
    }
  }

  String convertToDoubleDigit(int min){
    if(min<10){
      return "0$min";
    }else{
      return "$min";
    }
  }

  @override
  Widget build(BuildContext context) {
    final int day = dateTime.day;
    final int monthNum = dateTime.month;
    final String month = checkMonth(monthNum);
    final int hour = dateTime.hour;
    final int min = dateTime.minute;
    return Text(
        '$day-$month ${convertToDoubleDigit(convertTo12h(hour))}:${convertToDoubleDigit(min)} ${checkIsAfternoon(hour)}');
  }
}
