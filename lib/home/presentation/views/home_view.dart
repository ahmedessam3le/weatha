import 'package:flutter/material.dart';
import 'package:weatha/core/base/base_view.dart';
import 'package:weatha/core/const/app_strings.dart';
import 'package:weatha/core/style/app_widgets.dart';
import 'package:weatha/home/presentation/view_model/home_view_model.dart';
import 'package:weatha/home/presentation/widgets/day_hourly_view.dart';
import 'package:weatha/home/presentation/widgets/location_widget.dart';
import 'package:weatha/home/presentation/widgets/main_widgets.dart';
import 'package:weatha/home/presentation/widgets/temp_widget.dart';
import 'package:weatha/home/presentation/widgets/time_widget.dart';

import '../../../core/utils/app_utils.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      init: (HomeViewModel vm) => vm.init(),
      builder: (BuildContext context, HomeViewModel vm, Widget? child) {
        return vm.isBusy()
            ? const AppProgress()
            : Scaffold(
                appBar: AppBar(
                  leading: const Padding(
                    padding: EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                      left: 12,
                    ),
                    child: AppIcon(size: 30),
                  ),
                  title: const Text(AppStrings.appName),
                  actions: vm.isScreenError
                      ? null
                      : [
                          buildMainPopUp(
                            context: context,
                            popUpItems: vm.popUpModels,
                          ),
                        ],
                  bottom: appBarDivider(),
                ),
                body: refreshIndicatorView(
                  onRefresh: () => vm.refreshScreen(context),
                  child: vm.isScreenError
                      ? const SomethingWentWrongView()
                      : Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 760),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildLocationWidget(
                                  context: context,
                                  location: AppUtils.getClearName(
                                    vm.location.city,
                                    vm.location.country,
                                    comma: true,
                                  ),
                                ),
                                buildTimeWidget(
                                  context: context,
                                  time: vm.forecast?.current.dateTime,
                                ),
                                buildTempWidget(
                                  context: context,
                                  temp: vm.forecast?.current.temperature,
                                  description: vm.forecast?.current.weather
                                      .first.description,
                                  icon: vm.forecast?.current.weather.first.icon,
                                ),
                                buildDayOrHourlyView(
                                  context: context,
                                  viewIndex: vm.viewIndex,
                                  weatherHourly: vm.forecast?.hourly ?? [],
                                  weatherByDay: vm.forecast?.daily ?? [],
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              );
      },
    );
  }
}
