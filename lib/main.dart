import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/Categories/categories_main_page.dart';
import 'package:firebase_core/firebase_core.dart';

late int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /*SharedPreferences preferences=await SharedPreferences.getInstance();
  initScreen=(await preferences.getInt('initScreen'));
  await preferences.setInt('initScreen', 1);*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Categories_Main_Page()
    );
  }
}