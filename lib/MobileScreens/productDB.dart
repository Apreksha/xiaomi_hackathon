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

  Future updateUserData(String name,String email,bool isVerified,List address,List Custemail,List Custname,List phone,List orderNo,List productImg,List productName,List price) async {
    return await myCollection.doc(uid).set({
      'name':name,
      'email':email,
      'isVerified':isVerified,
      'address': address,
      'Custemail':Custemail,
      'Custname':Custname,
      'CustPhone':phone,
      'orderNo':orderNo,
      'productImg':productImg,
      'productName':productName,
      'productPrice':price
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