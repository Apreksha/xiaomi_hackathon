import 'package:cloud_firestore/cloud_firestore.dart';

class productDB{

 Future<List> productDetails() async{
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('products');
    QuerySnapshot querySnapshot = await _collectionRef.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();

 }
 
 Stream<List<Products>> readProdcts()=>FirebaseFirestore
     .instance
     .collection('products').
 snapshots()
 .map((snapshot) =>
     snapshot.docs.map((doc) =>
         Products.fromJson(doc.data())).toList());
 
}

class Products{
 List discountPrice;
 List<Map<String,String>> images;
 List name;
 List price;

 Products({
  required this.discountPrice,
  required this.images,
  required this.name,
  required this.price
});
 Map<String , dynamic>toJson()=>{
  'discountPrice': discountPrice,
  'images':images,
  'name':name,
  'price':price,
 };
 static Products fromJson(Map<String,dynamic>json)=>Products(
     discountPrice: json['discountPrice'],
     images: json['images'],
     name: json['name'],
     price: json['price']);
}