import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Email {
  sendEmail() async {
    String username = 'jhilmilmehta789@gmail.com';
    String password = 'wfljxskkgvyikpgo';
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Your name')
      ..recipients.add('jhilmilmehta789@gmail.com')
      ..subject = 'Order confirmed from Xiaomi ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    var connection = PersistentConnection(smtpServer);
    await connection.send(message);
    await connection.close();
  }
}