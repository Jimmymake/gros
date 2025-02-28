import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/auth/sihnupscreen.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/cart/cart.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/carddesighn.dart';
import 'package:Matrix.sc/cartprovider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Productdetail extends StatefulWidget {
  final String categoryname;
  final String imageurl;
  final String productname;
  final double price;
  final String description;
  // final bool onpressedfavarite;
  // final double rating;
  // final double discountpercentage;
  // final bool isavailable;
  double newprice;
  final int starCount = 5;
  final double rating;

  Productdetail({
    super.key,
    required this.categoryname,
    required this.imageurl,
    required this.productname,
    required this.price,
    required this.description,
    // required this.onpressedfavarite,
    // required this.rating,
    // required this.discountpercentage,
    // required this.isavailable,
    this.newprice = 0,
    this.rating = 3,
  });

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  // final String categoryname = "Electronics";

  final int starCount = 5;

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // List _bannersnapimage = [];

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _firecategoty =
        FirebaseFirestore.instance.collection(widget.categoryname).snapshots();
    // Provider provider = context.watch()<CartProvider>();
    final provider = Provider.of<CartProvider>(context, listen: false);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
 
    List<String> sizes = ["S", "M", "L", "XL", "2XL"];
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<CartProvider>(
              builder: (context, value, child) => InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Cart();
                      }));
                    },
                    child: Badge(
                        label: Text("${value.mylist.length}"),
                        child: Icon(Icons.shopping_cart)),
                  )),
          SizedBox(
            width: 15,
          )
        ],
        iconTheme: IconThemeData(color: iconcolor),
        backgroundColor: primarycolor,
        title: Text("Product details"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                width: screenwidth,
                child: ClipRRect(
                    child: CachedNetworkImage(
                  imageUrl: widget.imageurl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return CardLoading(height: double.infinity);
                  },
                )),
              ),

//////////////////////////////////////////////////////////////////////////////////////////
              Consumer<CartProvider>(
                builder: (context, consumervalue, child) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              "${widget.productname}",
                              style: TextStyle(fontSize: 27),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              consumervalue.itemdecrement();
                            },
                            child: Container(
                              height: 27,
                              width: 27,
                              decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            style: TextStyle(fontSize: 20),
                            "${consumervalue.numberofitems}",
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              consumervalue.itemincrement();
                            },
                            child: Container(
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5)),
                              child: Center(
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(starCount, (index) {
                              return Icon(
                                index < widget.rating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: primarycolor,
                                size: 17,
                              );
                            }),
                          ),
                          Text(
                            "${widget.rating} |",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text("Reviews (1)",
                              style: TextStyle(color: Colors.grey))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("Color: As In Picture/Size:3XL"),
                    ),
                    SizedBox(
                      height: 21,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sizes.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                width: 19,
                                height: 17,
                                decoration: BoxDecoration(color: Colors.grey),
                                child: Center(
                                    child: Text(
                                  sizes[index],
                                  style: TextStyle(fontSize: 15),
                                )),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: screenheight * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 350),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 17,
                            ),
                            "${widget.description}",
                            maxLines: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Delivery Time",
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.alarm),
                        Text(
                          "    30 mins",
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total Price",
                            ),
                            Text(
                              "Ksh ${widget.newprice = widget.price * consumervalue.numberofitems}",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      width: 1,
                                      color: Colors.black,
                                    )),
                                backgroundColor: Colors.yellow.shade900),
                            onPressed: () {
                              // final myprovider = context.read<CartProvider>();

                              provider.addProduct(carddesighn(
                                  imageurl: widget.imageurl,
                                  productname: widget.productname,
                                  price: widget.newprice,
                                  description: widget.description,
                                  // onpressedfavarite: widget.onpressedfavarite,
                                  // rating: widget.rating,
                                  // discountpercentage: widget.discountpercentage,
                                  // isavailable: widget.isavailable,
                                  categoryname: widget.categoryname));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Add To Cart",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: iconcolor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "You Might Also Like",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firecategoty,
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

                  return GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _stream.data!.size,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.5),
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
                          categoryname: widget.categoryname,
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
