import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:weatha/core/const/app_strings.dart';

class TimeUtils {
  static DateTime getDate(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  static String getTimeHour(int? timestamp) {
    String time = "";
    if (timestamp != null) {
      try {
        DateTime date = getDate(timestamp);
        if (timestamp != 0) {
          time =
              "${date.hour} : ${date.minute.toString().length == 1 ? "0${date.minute}" : "${date.minute}"}";
        }
      } catch (e) {
        log(e.toString());
      }
    }

    return time;
  }

  static String getMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return AppStrings.jan.tr();
      case 2:
        return AppStrings.feb.tr();
      case 3:
        return AppStrings.mar.tr();
      case 4:
        return AppStrings.apr.tr();
      case 5:
        return AppStrings.may.tr();
      case 6:
        return AppStrings.jun.tr();
      case 7:
        return AppStrings.jul.tr();
      case 8:
        return AppStrings.aug.tr();
      case 9:
        return AppStrings.sept.tr();
      case 10:
        return AppStrings.oct.tr();
      case 11:
        return AppStrings.nov.tr();
      case 12:
        return AppStrings.dec.tr();
      default:
        return '';
    }
  }

  static String getDaysAndMonth(int? timestamp) {
    if (timestamp != null) {
      DateTime date = getDate(timestamp);
      return "${date.day} ${getMonth(date)}";
    } else {
      return "";
    }
  }
}
