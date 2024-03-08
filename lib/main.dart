import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:pet_nations/services/routing/router.dart';
import 'package:pet_nations/services/routing/routes.dart';
import 'package:pet_nations/src/core/theme/themes.dart';
import 'package:pet_nations/src/core/utils/environment/environment.dart';
import 'package:pet_nations/src/injector.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: Environment.fileName);
  SharedPreferences.getInstance().then((pref) {
    DependencyInjector(pref);
    runApp(const MyApp());
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: ((context, orientation, deviceType) {
        return GetMaterialApp(
          theme: ApplicationTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          getPages: AppRouter.routes,
          initialRoute: AppRoutes.splash,
          builder: EasyLoading.init(),
        );
      }),
    );
  }
}
