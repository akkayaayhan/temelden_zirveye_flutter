import 'package:flutter/material.dart';

import 'day07_lifeCycle_listView_navigation_demos/list_view_builder.dart';
import 'day09_postman_servis_future_try_catch/service_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ServiceLearn(),
    );
  }
}
