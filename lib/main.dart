/*import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
/*
HEy everyone , today we are going to seee how to integrate PAYTM payment gateway in flutter
paytm integration can be divided into 3 parts
1 -> txToken generation
2 -> checkout
3 -> payment status verification
first let's see backend set up
1st txtoken generation
let's see UI
we got a textfield and a button
here
you have to enter amount click button, on click token generation api
that's all let's see complete code then demo
before that there are some platform spefici thing
let's see it in action
thanks for watching
*/

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paytm Integration"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.currency_rupee),
                  hintText: "Enter payable amount",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  String amount = _controller.text.trim();
                  if (amount.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Enter amount"),
                      ),
                    );
                    return;
                  }
                  initiateTransaction(amount);
                },
                child: const Text("Pay"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initiateTransaction(String amount) async {
    Map<String, dynamic> body = {
      'amount': amount,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "paytmphp/generate_token.php",
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(res.body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      var bodyJson = jsonDecode(res.body);
      //  on success of txtoken generation api
      //  start transaction

      var response = AllInOneSdk.startTransaction(
        bodyJson['mid'], // merchant id  from api
        bodyJson['orderId'], // order id from api
        amount, // amount
        bodyJson['txToken'], // transaction token from api
        "", // callback url
        true, // isStaging
        false, // restrictAppInvoke
      ).then((value) {
        //  on payment completion we will verify transaction with transaction verify api
        //  after payment completion we will verify this transaction
        //  and this will be final verification for payment

        print(value);
        verifyTransaction(bodyJson['orderId']);
      }).catchError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.body),
        ),
      );
    }
  }

  void verifyTransaction(String orderId) async {
    Map<String, dynamic> body = {
      'orderId': orderId,
    };

    var parts = [];
    body.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    var res = await http.post(
      Uri.https(
        "10.0.2.2", // my ip address , localhost
        "paytmphp/verify_transaction.php", // let's check verifycation code on backend
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded", // urlencoded
      },
      body: formData,
    );

    print(res.body);
    print(res.statusCode);
// json decode
    var verifyJson = jsonDecode(res.body);
//  display result info > result msg

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(verifyJson['body']['resultInfo']['resultMsg']),
      ),
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
}*/

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
import 'package:xiaomi_hackathon/MobileScreens/HomePage/HomeScreen.dart';
import 'package:xiaomi_hackathon/MobileScreens/LoginScreen.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/orderHistoryDetail.dart';
import 'package:xiaomi_hackathon/MobileScreens/OrderHistory/order_history.dart';
import 'package:xiaomi_hackathon/MobileScreens/PaymentSuccess/email.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/add_to_cart_and_buy_button.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/cart_counter.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/color_and_spec.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/color_dot.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/product_body.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/product_title_with_image.dart';
import 'package:xiaomi_hackathon/MobileScreens/ProductDescription/products_details.dart';
import 'package:xiaomi_hackathon/MobileScreens/SplashScreen.dart';
import 'package:xiaomi_hackathon/MobileScreens/CustomerInformation/customerInformation.dart';
import 'package:xiaomi_hackathon/MobileScreens/filladdress.dart';
import 'package:xiaomi_hackathon/MobileScreens/navigationDrawer.dart';
import 'package:xiaomi_hackathon/MobileScreens/payment.dart';
import 'package:xiaomi_hackathon/MobileScreens/PaymentSuccess/payment_success.dart';
import 'package:xiaomi_hackathon/MobileScreens/PaymentSuccess/whatsapp.dart';
import 'package:xiaomi_hackathon/MobileScreens/test.dart';

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
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        'login': (BuildContext context) => new MyCustomLoginUI(),
        'navigationDrawer': (BuildContext context) => new NavigationDrawer(),
        'categoriesBody': (BuildContext context) => new Categories_Body(),
        'categories': (BuildContext context) => new Categories(),
        'checkout' : (BuildContext context) => new Checkout(),
        'orderHistory': (BuildContext context) => new OrderHistory(),
        'cart': (BuildContext context) => new Cart(),
        'cartBody': (BuildContext context) => new CartBody(),
        'cartItemCard': (BuildContext context) => new CartItemCard(),
        'categoriesMainPage' : (BuildContext context) => new CategoriesMainPage(),
        'itemCard': (BuildContext context) => new ItemCard(),
        'choosePayment': (BuildContext context) => new ChoosePayment(),
        'shippingAddress': (BuildContext context) => new ShippingAddress(),
        'showOrderDetails': (BuildContext context) => new ShowOrderDetails(),
        'orderHistoryDetails' : (BuildContext context) => new OrderHistoryDetails(),
        'paymentSuccess': (BuildContext context) => new PaymentSuccess(),
        'addToCartAndBuyButton': (BuildContext context) => new AddToCartAndBuyButton(),
        'cartCounter': (BuildContext context) => new CartCounter(),
        'productBody': (BuildContext context) => new ProductBody(),
        'productTitleWithImage' : (BuildContext context) => new ProductTitleWithImage(),
        'productDetails': (BuildContext context) => new ProductDetails(),
        'fillAddress' : (BuildContext context) => new FillAddress(),
        'splashScreen': (BuildContext context) => new SplashScreen(),
      }
    );
  }
}
