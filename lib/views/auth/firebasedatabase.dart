import 'package:cloud_firestore/cloud_firestore.dart';

class databasefunctions  {
  Future adduserdetails(Map<String, dynamic> userdetails, String userid,
      String collectionname) async {
    return await FirebaseFirestore.instance
        .collection(collectionname)
        .doc(userid)
        .set(userdetails);
  }
  
} 