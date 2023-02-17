import 'package:bonbon_new/controllers/bindings/auth_bindings.dart';
import 'package:bonbon_new/root.dart';
import 'package:bonbon_new/routes/routes_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialBinding: AuthBinding(),
          home: Root(),
          getPages: AppRoute.page,
          builder: EasyLoading.init(),
        );
      },
      designSize: const Size(360, 640),
    );
  }
}
