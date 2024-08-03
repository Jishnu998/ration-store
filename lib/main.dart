import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rationshopproject/presentation/common/Splash%20screen.dart';
import 'core/controller/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: " api key",
          appId: " appid ",
          messagingSenderId: "",
          projectId: "ration-shop-6406f",
          storageBucket: "ration-shop-6406f.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => tile_controller(),
        child:
        MaterialApp(debugShowCheckedModeBanner: false, home: ration_splash()));
  }
}