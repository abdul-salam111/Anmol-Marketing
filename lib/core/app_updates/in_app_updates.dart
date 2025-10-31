// ignore_for_file: invalid_return_type_for_catch_error

import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class AppUpdateService {
  static Future<void> checkForUpdate({bool immediate = false}) async {
    try {
      AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();

      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (immediate) {
          // Force update before continuing
          await InAppUpdate.performImmediateUpdate()
              .catchError((e) => debugPrint("Immediate update failed: $e"));
        } else {
          // Flexible update - download in background
          await InAppUpdate.startFlexibleUpdate()
              .then((_) => InAppUpdate.completeFlexibleUpdate())
              .catchError((e) => debugPrint("Flexible update failed: $e"));
        }
      }
    } catch (e) {
      debugPrint("Error checking for update: $e");
    }
  }
}
