import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/Categories/categories.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:xiaomi_hackathon/MobileScreens/HomePage/HomeScreen.dart';
import 'package:xiaomi_hackathon/MobileScreens/LoginScreen.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/order_history.dart';
import 'package:xiaomi_hackathon/MobileScreens/SplashScreen.dart';

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
    await Firebase.initializeApp();
  }
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
      home:HomeScreen(),
      routes: <String, WidgetBuilder>{
        'login': (BuildContext context) => new MyCustomLoginUI(),
        //'categoriesBody': (BuildContext context) => new Categories_Body(categoryIndex:0),
        'categories': (BuildContext context) => new Categories(),
       // 'checkout' : (BuildContext context) => new Checkout(),
        'orderHistory': (BuildContext context) => new OrderHistory(),
        //'cart': (BuildContext context) => new Cart(),
        'splashScreen': (BuildContext context) => new SplashScreen(),
      }
    );
  }
}
