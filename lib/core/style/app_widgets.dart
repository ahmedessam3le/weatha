import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatha/core/const/app_strings.dart';
import 'package:weatha/core/style/app_colors.dart';
import 'package:weatha/core/style/app_styles.dart';
import 'package:weatha/core/utils/app_utils.dart';

import '../const/app_assets.dart';

class AppProgress extends StatelessWidget {
  const AppProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppUtils.isApple()
          ? const CupertinoActivityIndicator()
          : CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
    );
  }
}

class SomethingWentWrongView extends StatelessWidget {
  const SomethingWentWrongView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 100, bottom: 40),
          child: Icon(
            Icons.flutter_dash,
            color: AppColors.green,
            size: 180,
          ),
        ),
        Text(
          AppStrings.somethingWentWrong.tr(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}

class AppNetworkImage extends StatelessWidget {
  final String? url;
  final bool isProgress;

  const AppNetworkImage(
    this.url, {
    Key? key,
    this.isProgress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black.withOpacity(0.03),
      child: url == null
          ? const MediaErrorIcon()
          : url!.isEmpty
              ? const MediaErrorIcon()
              : Image.network(
                  url!,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return isProgress ? const AppProgress() : const Offstage();
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return const MediaErrorIcon();
                  },
                ),
    );
  }
}

class MediaErrorIcon extends StatelessWidget {
  const MediaErrorIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.error_outline),
    );
  }
}

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      height: 1,
      indent: 0,
    );
  }
}

class AppIcon extends StatelessWidget {
  final double size;

  const AppIcon({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AppStyles.mainIconHT,
      child: ClipOval(
        child: Image.asset(
          AppAssets.appIcon,
          width: size,
          height: size,
        ),
      ),
    );
  }
}

PreferredSize appBarDivider() {
  return const PreferredSize(
    preferredSize: Size.fromHeight(1),
    child: AppDivider(),
  );
}

RefreshIndicator refreshIndicatorView({
  required Future<void> Function() onRefresh,
  required Widget child,
}) {
  return RefreshIndicator(
    color: AppColors.green,
    backgroundColor: AppColors.white,
    onRefresh: onRefresh,
    child: SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: child,
        ),
      ),
    ),
  );
}

class PopUpModel {
  final String title;
  final Function func;

  PopUpModel({
    required this.title,
    required this.func,
  });
}
