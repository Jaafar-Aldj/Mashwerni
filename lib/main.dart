import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mashwerni/binding/initialbinding.dart';
import 'package:mashwerni/core/localization/changelocal.dart';
import 'package:mashwerni/core/localization/translation.dart';
import 'package:mashwerni/core/service/services.dart';
import 'package:mashwerni/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      getPages: routes,
      initialBinding: InitialBinding(),
    );
  }
}
