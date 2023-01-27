import 'package:fidu_service/resources/colors.dart';
import 'package:fidu_service/resources/strings.dart';
import 'package:fidu_service/util/connectivity_service.dart';
import 'package:fidu_service/util/secure_storage.dart';
import 'package:fidu_service/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/splash_screen/splash_screen.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  secureStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
        child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        // fontFamily: 'AvenirNext',
        backgroundColor: backgroundColor,
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.varelaRoundTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),
      ),
      // theme: ThemeData(
      //   fontFamily: 'SourceSans',
      // ),
    ));
  }
}
