import 'package:cloud_firestore/cloud_firestore.dart';

class productDB{

 Future<List> productDetails() async{
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('products');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();

 }
}



class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference myCollection = FirebaseFirestore.instance
      .collection('Operators');

  Future updateUserData(String name,String email,bool isVerified,List choice,List custAdd,List custCity,List custEmail,List custName,List custPhone,List custPincode,List custState,List orderNo,List prodName,List prodPrice, List paymentMode) async {
    return await myCollection.doc(uid).set({
      'name':name,
      'email':email,
      'isVerified':isVerified,
      'choice': choice,
      'custAdd':custAdd,
      'custCity':custCity,
      'custEmail':custEmail,
      'custName':custName,
      'custPhone':custPhone,
      'custPincode':custPincode,
      'custState':custState,
      'orderNo':orderNo,
      'prodName':prodName,
      'prodPrice':prodPrice,
      'paymentMode':paymentMode
    });
  }

  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

  Future<void> addItems(List image,List productName,List quantity,List totalPrice) {
    // Calling the collection to add a new user
    return cart.doc(uid)
    //adding to firebase collection
        .update({
      //Data added in the form of a dictionary into the document.
      'image': image,
      'productName': productName,
      'quantity': quantity,
      'totalPrice': totalPrice
    })
        .then((value) => print("Student data Added"))
        .catchError((error) => print("Student couldn't be added."));
  }
}