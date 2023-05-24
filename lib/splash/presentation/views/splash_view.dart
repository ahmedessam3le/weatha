import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatha/core/base/base_view.dart';
import 'package:weatha/core/style/app_widgets.dart';
import 'package:weatha/core/utils/app_router.dart';
import 'package:weatha/splash/presentation/view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  void goRouter(BuildContext context) => context.go(AppRoutes.homeRoute);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      init: (SplashViewModel viewModel) => viewModel.init(
        () {
          goRouter(context);
        },
      ),
      builder: (
        BuildContext context,
        SplashViewModel viewModel,
        Widget? child,
      ) {
        return viewModel.isBusy()
            ? const AppProgress()
            : const Scaffold(
                body: Center(
                  child: AppIcon(
                    size: 240,
                  ),
                ),
              );
      },
    );
  }
}
