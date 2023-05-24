import 'package:flutter/material.dart';
import 'package:weatha/core/utils/time_utils.dart';

Widget buildTimeWidget({
  required BuildContext context,
  required int? time,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, top: 6),
    child: Text(
      TimeUtils.getDaysAndMonth(time),
      softWrap: true,
      style: Theme.of(context).textTheme.bodyText1,
    ),
  );
}
