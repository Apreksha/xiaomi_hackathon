import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  final String uid;
  Database({required this.uid});
  final CollectionReference users=FirebaseFirestore.instance.collection("Operators");
  Future updateCustomerData(String customerName, String email, var phone) async{
    return await users.doc(uid).set({
      'Email': email,
      'Customer Name': customerName,
      'Contact Number':phone,
    });
  }
}