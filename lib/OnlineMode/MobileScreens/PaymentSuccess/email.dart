import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Email {
  sendEmail(String orderNo, String customerName, String customerEmail, int total) async {
    String string1 = "Thank you for your order. We’ll send a confirmation when your order ships. "
        "If you would like to view the status of your order or make any changes to it, please visit your nearest Mi Store.";
    String username = 'jhilmilmehta789@gmail.com';
    String password = 'wfljxskkgvyikpgo';
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address('Xiaomi Store')
      ..recipients.add(customerEmail)
      ..subject = 'Order confirmed from Xiaomi'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h2>Order Confirmation</h2>\n<p>Hello $customerName,<br>$string1</p>"
          "<h2>Order summary</h2>\n<p>Order #$orderNo</p><p>Placed on ${DateTime.now()}</p>"
          "<b>Order Total: Rs.$total.00</b></p>"
          "<br><br><p>We hope to see you again soon.\n<h4>Xiaomi, India</h4></p>"
      ..attachments=[FileAttachment(File('D:/AndroidStudioProjects/xiaomi_hackathon/assets/temp.pdf'))]
    ;

    var connection = PersistentConnection(smtpServer);
    await connection.send(message);
    await connection.close();
  }
}
