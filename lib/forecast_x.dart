import 'package:flutter/material.dart';
import 'package:forecast_x/features/router/router.dart';

class ForecartXApp extends StatelessWidget {
  const ForecartXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Forecast X', routerConfig: router);
  }
}
