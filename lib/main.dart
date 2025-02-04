import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize(); // flutter_screenutil
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAUnWyS3qhMMNL31QhY6vqUt3xCcMCdArI",
    appId: "1:203030177165:android:40504b50d75caf0b6dc9c4",
    messagingSenderId: "203030177165",
    projectId: "chapter7-bde41",
    storageBucket: "gs://chapter7-bde41.appspot.com",
  )); // firebase_core

  await GetStorage.init(); // get_storage
  tz.initializeTimeZones(); // timezone for local notification
  runApp(
    ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          fontFamily: "Poppins",
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
              .copyWith(background: Colors.white),
        ),
      ),
    ),
  );
}
