import 'package:flutter/material.dart';
import 'package:temelden_zirveye_flutter/random_image.dart';

import 'day07_lifeCycle_listView_navigation_demos/list_view_builder.dart';
import 'day08_model_tabbar_nullable/tab_learn.dart';
import 'day09_postman_servis_future_try_catch/coments_learn_view.dart';
import 'day09_postman_servis_future_try_catch/service_learn_view.dart';
import 'day09_postman_servis_future_try_catch/service_post_learn_view.dart';
import 'day10_theme_package_textfieldAdvanced/package_learn_view.dart';
import 'day10_theme_package_textfieldAdvanced/password_text_field.dart';
import 'day10_theme_package_textfieldAdvanced/theme_learn_view.dart';
import 'day11_animasyonlar_extension_oop_imageAdvanced/animated_learn_view.dart';
import 'day12_shared_preferences_secure_jwt_cache/shared_learn_cache.dart';
import 'day13_sheet_alert_ios_android_dialog_generic/sheet_alert_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const SheetAlertDialog(),
    );
  }
}
