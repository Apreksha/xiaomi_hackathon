import 'package:cloud_firestore/cloud_firestore.dart';

class productDB{

 Future<List> productDetails() async{
   List alldata=[];
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('products');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    alldata = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(alldata[7]['images'][0]['image1']);
    return alldata;
 }
}