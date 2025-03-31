import 'package:flutter/material.dart';
import 'package:forecast_x/db/db.dart';
import 'package:forecast_x/forecast_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.instance.init();
  runApp(const ForecartXApp());
}
