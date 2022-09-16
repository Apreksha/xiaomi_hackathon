import 'package:url_launcher/url_launcher.dart';

class Whatsapp{
  sendMessage(String number, String customerName, String productName, String productPrice, String orderNo) async{

    String string1 = "Thank you for your order. We’ll send a confirmation when your order ships. "
        "If you would like to view the status of your order or make any changes to it, please visit your nearest Mi Store.";
    String message='Order confirmed from Xiaomi\nHello $customerName,\n$string1\n\n'
        'Order No: $orderNo\nProduct Name: $productName\nOrder Total: Rs.$productPrice.00'
        '\nWe hope to see you again soon.\nXiaomi, India';

    var url="whatsapp://send?phone=$number&text=$message";
    await launch(url);
  }
}

