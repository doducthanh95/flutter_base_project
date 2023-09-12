import 'package:flutter/material.dart';
import 'package:flutter_base_project/utils/common/app_cubit.dart';
import 'package:flutter_base_project/utils/common/theme_provider.dart';
import 'package:flutter_base_project/utils/config/app_config.dart';
import 'package:flutter_base_project/utils/constants/one_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  var currentLanguage = 'VN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'setting'.tr(),
          style: OneStyle.heading2
              .apply(color: OneColorProvider.instance.primary100),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(AppConfig.instance.appTheme == AppTheme.light
                  ? 'light_theme'.tr()
                  : 'dark_theme'.tr()),
              onTap: () {
                context.read<AppCubit>().changeThemeApp();
              },
            ),
            ListTile(
              title: Text('language'.tr()),
              trailing: Text(
                currentLanguage,
                style: OneStyle.heading3.apply(color: Colors.black),
              ),
              onTap: () {
                if (currentLanguage == 'VN') {
                  currentLanguage = "US";
                  context.setLocale(const Locale('en', 'US'));
                } else {
                  currentLanguage = "VN";
                  context.setLocale(const Locale('vi', 'VI'));
                }
                context.read<AppCubit>().changeLanguage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
