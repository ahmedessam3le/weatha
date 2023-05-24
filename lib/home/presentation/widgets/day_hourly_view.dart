import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weatha/core/const/app_strings.dart';
import 'package:weatha/home/presentation/widgets/main_widgets.dart';

import '../../../core/utils/time_utils.dart';
import '../../domain/entities/daily.dart';
import '../../domain/entities/hourly.dart';

Widget buildDayOrHourlyView({
  required BuildContext context,
  required int viewIndex,
  required List<Hourly> weatherHourly,
  required List<Daily> weatherByDay,
}) {
  switch (viewIndex) {
    case 0:
      return weatherHourly.isEmpty
          ? const Offstage()
          : _buildWeatherView(
              context: context,
              header: AppStrings.hourlyWeather.tr(),
              children: weatherHourly
                  .map((e) => _buildWeatherItem(
                        context: context,
                        head: TimeUtils.getTimeHour(e.dateTime),
                        temp: e.temperature,
                        icon: e.weather[0].icon,
                        weather: e.weather[0].main,
                      ))
                  .toList(),
            );
    case 1:
      return weatherByDay.isEmpty
          ? const Offstage()
          : _buildWeatherView(
              context: context,
              header: AppStrings.weatherByDay.tr(),
              children: weatherByDay
                  .map((e) => _buildWeatherItem(
                        context: context,
                        head: TimeUtils.getDaysAndMonth(e.dateTime),
                        temp: e.temperature.day,
                        icon: e.weather[0].icon,
                        weather: e.weather[0].main,
                      ))
                  .toList(),
            );
    default:
      return const Offstage();
  }
}

Widget _buildWeatherItem({
  required BuildContext context,
  required String head,
  required num? temp,
  required String? icon,
  required String weather,
}) {
  return Container(
    clipBehavior: Clip.hardEdge,
    margin: const EdgeInsets.all(6),
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    constraints: const BoxConstraints(
      minWidth: 110,
      minHeight: 150,
    ),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            head,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        buildTempText(
          context: context,
          temp: temp,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: buildWeatherIcon(icon),
        ),
        Text(
          weather.toLowerCase(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    ),
  );
}

Widget _buildWeatherView({
  required BuildContext context,
  required String header,
  required List<Widget> children,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 42, left: 16, bottom: 12),
        child: Text(
          header,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      kIsWeb
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                children: children,
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: children,
                ),
              ),
            ),
    ],
  );
}
