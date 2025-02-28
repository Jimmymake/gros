import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/carddesighn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  final String categoryname = "Health";
  final Stream<QuerySnapshot> _health =
      FirebaseFirestore.instance.collection("Health").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // StreamBuilder<QuerySnapshot>(
          //   stream: _health,
          //   builder:
          //       (BuildContext context, AsyncSnapshot<QuerySnapshot> _stream) {
          //     if (_stream.hasError) {
          //       return const Text("something went wrong");
          //     }

          //     if (_stream.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: CircularProgressIndicator(
          //           color: Colors.yellow.shade700,
          //         ),
          //       );
          //     }

          //     return Expanded(
          //       child: GridView.builder(
          //           itemCount: _stream.data!.size,
          //           gridDelegate:
          //               const SliverGridDelegateWithFixedCrossAxisCount(
          //                   crossAxisCount: 2, childAspectRatio: 1 / 1.5),
          //           itemBuilder: (context, Index) {
          //             final _productstream = _stream.data!.docs[Index];
          //             return Column(
          //               children: [
          //                carddesighn(
          //                   imageurl: _productstream["image"],
          //                   productname: _productstream["productname"],
          //                   price: double.parse(_productstream["price"]) ,
          //                   description: _productstream["description"],
          //                   // onpressedfavarite: true,
          //                   // rating: 42,
          //                   // discountpercentage: 23,
          //                   // isavailable: true,
          //                   categoryname: categoryname,
          //                 )
          //               ],
          //             );
          //           }),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
