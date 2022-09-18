import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xiaomi_hackathon/OnlineMode/MobileScreens/SplashScreen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCxgRA9W-RgD6_4JixQ50Gr7xObktxwggo",
            appId: "1:591137994222:web:35f481e95e14624a7e8aff",
            messagingSenderId: "591137994222",
            projectId: "xiaomi-hackathon")
    );

  }else{
    await Hive.initFlutter();
    var box = await Hive.openBox('mybox');
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}
