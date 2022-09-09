
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/Screens/CartScreen/cart.dart';
import 'package:xiaomi_hackathon/Screens/CartScreen/cart_body.dart';
import 'package:xiaomi_hackathon/Screens/Categories/categories_main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:xiaomi_hackathon/Screens/Checkout/checkout.dart';
import 'package:xiaomi_hackathon/Screens/OrderHistory/order_history.dart';
import 'package:xiaomi_hackathon/Screens/PaymentSuccess/email.dart';
import 'package:xiaomi_hackathon/Screens/customerInformation.dart';
import 'package:xiaomi_hackathon/Screens/filladdress.dart';
import 'package:xiaomi_hackathon/Screens/payment.dart';
import 'package:xiaomi_hackathon/Screens/PaymentSuccess/payment_success.dart';
import 'package:xiaomi_hackathon/Screens/PaymentSuccess/whatsapp.dart';
import 'package:xiaomi_hackathon/Screens/test.dart';

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
        home: Cart()
    );
  }
}
