import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:universal_html/html.dart' as html;
import 'package:weatha/core/const/app_strings.dart';

import '../const/app_values.dart';
import '../style/app_colors.dart';

class AppUtils {
  static bool isApple() {
    return defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void errorToast({required String? code, String? msg}) {
    Fluttertoast.showToast(
      msg: 'Error Code: $code\nError Message: $msg',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.white.withOpacity(0.4),
      textColor: AppColors.black,
      fontSize: 16.0,
    );
  }

  static String getWeatherImage(String? icon) {
    String res = "";
    if (icon != null) {
      if (icon.isNotEmpty) {
        res = AppValues.imgUrl + icon + AppValues.png;
      }
    }
    return res;
  }

  static String k2c(double? k) {
    if (k == null) {
      return AppStrings.notSpecified;
    } else {
      return (k - 273.15).toStringAsFixed(1);
    }
  }

  static double? doubleParser(data) {
    try {
      final double? doubleResult = double.tryParse(data.toString());
      if (doubleResult != null) {
        return doubleResult;
      } else {
        int? intResult = int.tryParse(data.toString());
        if (intResult != null) {
          return intResult.toDouble();
        } else {
          return null;
        }
      }
    } catch (e) {
      return null;
    }
  }

  static String getClearName(String? firstName, String? lastName,
      {comma = false}) {
    return (firstName ?? '') +
        (firstName == null
            ? ''
            : firstName.isEmpty
                ? ''
                : comma
                    ? lastName == null
                        ? ''
                        : lastName.isEmpty
                            ? ''
                            : ', '
                    : ' ') +
        (lastName ?? '');
  }

  static String getLanguageCode() {
    try {
      String? langCode;
      if (kIsWeb) {
        langCode = html.window.navigator.language;
        if (langCode != null) {
          langCode = langCode.split("_")[0];
        }
      } else {
        langCode = Platform.localeName.split("_").first;
      }
      switch (langCode) {
        case AppValues.langCodeAr:
          return AppValues.langCodeAr;
        case AppValues.langCodeEn:
          return AppValues.langCodeEn;
        default:
          return AppValues.langCodeBasic;
      }
    } catch (e) {
      return AppValues.langCodeBasic;
    }
  }

  static Uri? getUri(String url) {
    return Uri.tryParse(url);
  }

  static Future<void> futureDelayed({int m = 1000}) async {
    await Future.delayed(Duration(milliseconds: m));
  }
}
