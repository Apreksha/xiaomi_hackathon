import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart_body.dart';
import 'package:xiaomi_hackathon/MobileScreens/CartScreen/cart_item_card.dart';
import 'package:xiaomi_hackathon/MobileScreens/Categories/categories.dart';
import 'package:xiaomi_hackathon/MobileScreens/Categories/categories_body.dart';
import 'package:xiaomi_hackathon/MobileScreens/Categories/categories_main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:xiaomi_hackathon/MobileScreens/Categories/item_card.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/checkout.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/choosePayment.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/shippingAddress.dart';
import 'package:xiaomi_hackathon/MobileScreens/Checkout/showOrderDetails.dart';
import 'package:xiaomi_hackathon/MobileScreens/CustomerInformation/customerInformation.dart';
import 'package:xiaomi_hackathon/MobileScreens/HomePage/HomeScreen.dart';
import 'package:xiaomi_hackathon/MobileScreens/PaymentSuccess/whatsapp.dart';
import 'package:xiaomi_hackathon/MobileScreens/loginScreen.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/orderHistoryDetail.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/order_history.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/cart_counter.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/product_body.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/products_details.dart';
import 'package:xiaomi_hackathon/MobileScreens/splashScreen.dart';
import 'package:xiaomi_hackathon/MobileScreens/filladdress.dart';
import 'package:xiaomi_hackathon/MobileScreens/navigationDrawer.dart';
import 'package:xiaomi_hackathon/MobileScreens/PaymentSuccess/payment_success.dart';
import 'package:xiaomi_hackathon/MobileScreens/storeInformation.dart';
import 'package:xiaomi_hackathon/MobileScreens/test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
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
        home: Test(),
        routes: <String, WidgetBuilder>{
          'login': (BuildContext context) => new MyCustomLoginUI(),
          'navigationDrawer': (BuildContext context) => new NavigationDrawer(),
          'categories': (BuildContext context) => new Categories(),
          'orderHistory': (BuildContext context) => new OrderHistory(),
          'cart': (BuildContext context) => new Cart(),
          'cartBody': (BuildContext context) => new CartBody(),
          'cartItemCard': (BuildContext context) => new CartItemCard(),
          'shippingAddress': (BuildContext context) => new ShippingAddress(),
          'cartCounter': (BuildContext context) => new CartCounter(),
          'productBody': (BuildContext context) => new ProductBody(),
          'productDetails': (BuildContext context) => new ProductDetails(),
          'fillAddress' : (BuildContext context) => new FillAddress(),
          'splashScreen': (BuildContext context) => new SplashScreen(),
          'customerInformation' : (BuildContext context) => new CustomerInformation()
        }
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}