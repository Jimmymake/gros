import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mobilephone extends StatefulWidget {
  const Mobilephone({super.key});

  @override
  State<Mobilephone> createState() => _MobilephoneState();
}

class _MobilephoneState extends State<Mobilephone> {
  final String categoryname = "Electronics";

  final Stream<QuerySnapshot> _electronics =
      FirebaseFirestore.instance.collection("Electronics").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Mobile Phones"),),body: Column(children: [
       StreamBuilder<QuerySnapshot>(
            stream: _electronics,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> _stream) {
              if (_stream.hasError) {
                return const Text("something went wrong");
              }

              if (_stream.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow.shade700,
                  ),
                );
              }

              return Expanded(
                child: GridView.builder(
                    itemCount: _stream.data!.size,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.5),
                    itemBuilder: (context, Index) {
                      final _productstream = _stream.data!.docs[Index];
                      return Column(children: [


                        
                        // carddesighn(
                        //     imageurl: _productstream["image"],
                        //     productname: _productstream["productname"],
                        //     price: double.parse(_productstream["price"]) ,
                        //     description: _productstream["description"],
                        //     // onpressedfavarite: true,
                        //     // rating: 42,
                        //     // discountpercentage: 23,
                        //     // isavailable: true,
                        //     categoryname: categoryname,
                        //   )
                      ]);
                    }),
              );
            },
          ),

    ],),);
  }
}