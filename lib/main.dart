import 'package:flutter/material.dart';
import 'core/barrel.dart';

AnmolMarketingDatabase? anmolMarketingDatabase;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //check whethe the app is in testing mode or not
  if (await storage.testingToken != 'true') {
    await storage.setValues(StorageKeys.testingToken, "false");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anmol Marketing App Clean Architecture',
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: AppThemes.darkTheme,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
    );
  }
}

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<DioHelper>(DioHelper(), permanent: true);
    Get.put<AnmolMarketingDatabase>(
      AnmolMarketingDatabase()..initializeDatabase(),
      permanent: true,
    );
  }
}
