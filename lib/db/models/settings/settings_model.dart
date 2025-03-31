import 'package:forecast_x/db/models/db_model.dart';

class SettingsModel implements DbModel {
  @override
  int id;
  bool isFirstLaunch;

  SettingsModel({
    required this.id,
    required this.isFirstLaunch,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'isFirstLaunch': isFirstLaunch,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      isFirstLaunch: map['isFirstLaunch'] == 1 ? true : false,
      id: map['id'] as int,
    );
  }
}
