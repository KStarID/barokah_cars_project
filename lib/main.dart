import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/service/firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // Tambahkan delay
    await Future.delayed(const Duration(seconds: 2));

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BaroCars Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  } catch (e, stackTrace) {
    print('Error during initialization: $e');
    print('Stack trace: $stackTrace');
  }
}
