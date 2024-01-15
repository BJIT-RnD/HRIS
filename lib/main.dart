// main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigation_demo/firebase_api/firebase_api.dart';
import 'package:navigation_demo/utils/localization/language.dart';
import '../onboarding/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

//void main() => runApp(const App());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 1));
  await FirebaseAPI().initNotifications();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return GetMaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: OnBoardingPage(),
      ),
    );
  }
}
