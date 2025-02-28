import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/home/widgets/banner.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/carddesighn.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/carousel.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/flashsale.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final String sportscategoryname = "Sports";
  final String fashioncategoryname = 'Fashion';
  final String mediacategoryname = "Media";

  final String beautycategoryname = 'Beauty';

  final Stream<QuerySnapshot> _sports =
      FirebaseFirestore.instance.collection("Sports").snapshots();

  final Stream<QuerySnapshot> _fashion =
      FirebaseFirestore.instance.collection("Fashion").snapshots();
  final Stream<QuerySnapshot> _media =
      FirebaseFirestore.instance.collection("Media").snapshots();
  final Stream<QuerySnapshot> _beauty =
      FirebaseFirestore.instance.collection("Beauty").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 25,
        leading: Image.asset(
          color: Colors.white,
          "assets/icon/icon.png",
        ),
        actions: [
          SizedBox(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    color: Colors.white,
                    "assets/icons/search.svg",
                    width: 20,
                  ),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                hintText: "Search for product",
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: primarycolor,
              ),
            ),
          ),
        ],
        backgroundColor: primarycolor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1,
              )
              // welcometext(),
              // const SizedBox(
              //   height: 14,
              // ),
              // SearchInput(),`
              ,
              OffersCarousel(),
              SizedBox(
                height: 7,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _sports,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> _stream) {
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

                  return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _stream.data!.size,
                        itemBuilder: (context, Index) {
                          final _productstream = _stream.data!.docs[Index];
                          return carddesighn(
                            imageurl: _productstream["image"],
                            productname: _productstream["productname"],
                            price: double.parse(_productstream["price"]),
                            description: _productstream["description"],
                            // onpressedfavarite: true,
                            // rating: 42,
                            // discountpercentage: 23,
                            // isavailable: true,
                            categoryname: sportscategoryname,
                          );
                        }),
                  );
                },
              ),
              // SvgPicture.asset("assets/svgions/sports-volleyball-svgrepo-com.svg",color: primarycolor,),
              StreamBuilder<QuerySnapshot>(
                stream: _fashion,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> _stream) {
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

                  return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _stream.data!.size,
                        itemBuilder: (context, Index) {
                          final _productstream = _stream.data!.docs[Index];
                          return carddesighn(
                            imageurl: _productstream["image"],
                            productname: _productstream["productname"],
                            price: double.parse(_productstream["price"]),
                            description: _productstream["description"],
                            // onpressedfavarite: true,
                            // rating: 42,
                            // discountpercentage: 23,
                            // isavailable: true,
                            categoryname: fashioncategoryname,
                          );
                        }),
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
              Bannerwidget(),
              StreamBuilder<QuerySnapshot>(
                stream: _media,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> _stream) {
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

                  return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _stream.data!.size,
                        itemBuilder: (context, Index) {
                          final _productstream = _stream.data!.docs[Index];
                          return carddesighn(
                            imageurl: _productstream["image"],
                            productname: _productstream["productname"],
                            price: double.parse(_productstream["price"]),
                            description: _productstream["description"],
                            // onpressedfavarite: true,
                            // rating: 42,
                            // discountpercentage: 23,
                            // isavailable: true,
                            categoryname: mediacategoryname,
                          );
                        }),
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
              Flashsale(),
              StreamBuilder<QuerySnapshot>(
                stream: _beauty,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> _stream) {
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

                  return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _stream.data!.size,
                        itemBuilder: (context, Index) {
                          final _productstream = _stream.data!.docs[Index];
                          return carddesighn(
                            imageurl: _productstream["image"],
                            productname: _productstream["productname"],
                            price: double.parse(_productstream["price"]),
                            description: _productstream["description"],
                            // onpressedfavarite: true,
                            // rating: 42,
                            // discountpercentage: 23,
                            // isavailable: true,
                            categoryname: beautycategoryname,
                          );
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
