import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/productdetail.dart';
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class carddesighn extends StatefulWidget {
  final String categoryname;
  final String imageurl;
  final String productname;
  final double price;
  final String description;
  // final bool onpressedfavarite;
  // final double rating;
  // final double discountpercentage;
  // final bool isavailable;

  carddesighn({
    super.key,
    required this.categoryname,
    required this.imageurl,
    required this.productname,
    required this.price,
    required this.description,
    // this.onpressedfavarite = false,
    // required this.rating,
    // required this.discountpercentage,
    // this.isavailable = false,
  });

  // // Convert object to JSON
  // Map<String, dynamic> toJson() {
  //   return {
  //     'categoryname': categoryname,
  //     'imageurl': imageurl,
  //     'productname': productname,
  //     'price': price,
  //     'descrption': description,
  //     'onpresedfav': onpressedfavarite,
  //     'rating': rating,
  //     'discountpercentage': discountpercentage,
  //     'isvisible': isavailable,
  //   };
  // }

  // // Create object from JSON
  // factory carddesighn.fromJson(Map<String, dynamic> json) {
  //   return carddesighn(
  //     imageurl: json['imageurl'],
  //     productname: json["productname"],
  //     price: json["price"],
  //     onpressedfavarite: json["onpressedfavarite"]?? false,
  //     description: json["description"],
  //     rating: json["rating"],
  //     discountpercentage: json["discountpercentage"],
  //     isavailable: json["isavailable"]?? false,
  //     categoryname: json["categoryname"],
  //   );
  // }

  // factory carddesighn.fromJson(Map<String, dynamic> json) {
  //   return carddesighn(
  //     imageurl: json['imageurl'] ?? '', // Default to empty string if null
  //     productname: json["productname"] ?? '',
  //     price: (json["price"] ?? 0)
  //         .toDouble(), // Convert to double with a default value
  //     onpressedfavarite:
  //         json["onpressedfavarite"] ?? false, // Default to false if null
  //     description: json["description"] ?? '',
  //     rating: (json["rating"] ?? 0)
  //         .toDouble(), // Convert to double with a default value
  //     discountpercentage: (json["discountpercentage"] ?? 0).toDouble(),
  //     isavailable: json["isavailable"] ?? false, // Default to false if null
  //     categoryname: json["categoryname"] ?? '',
  //   );
  // }

  @override
  State<carddesighn> createState() => _carddesighnState();
}

class _carddesighnState extends State<carddesighn> {
  // bool onfavouritepresses = false;

  // final String categoryname = "Fashion";
  @override
  Widget build(BuildContext context) {
    return OpenContainer(transitionDuration: Duration(milliseconds: 700),
        closedColor: Colors.white,
        openElevation: 0,
        closedElevation: 0,
        openBuilder: (context, _) {
          return Productdetail(
            categoryname: widget.categoryname,
            imageurl: widget.imageurl,
            productname: widget.productname,
            price: widget.price,
            description: widget.description,
            // onpressedfavarite: widget.onpressedfavarite,
            // rating: widget.rating,  
            // discountpercentage: widget.discountpercentage,
            // isavailable: widget.isavailable,
          );
        },transitionType: ContainerTransitionType.fadeThrough,
        // closedShape: CircleBorder(),
         closedBuilder: (context, _) {
          return SizedBox(
            height: 200,
            width: 150,
            child: AspectRatio(
              aspectRatio: 6.7,
              child: Card(
                elevation: 0,
                color: Colors.white,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(20),
                //   side: BorderSide(width: 1, color: Colors.grey.shade400),
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.imageurl,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) {
                                      return CardLoading(
                                          height: double.infinity);
                                    },
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  widget.categoryname,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontFamily: "Brand-Bold"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  widget.productname,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        style: TextStyle(fontSize: 12),
                                        "Ksh ${widget.price}",
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        "ksh ${widget.price}",
                                        style: TextStyle(
                                          fontSize: 8,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic,
                                          // foreground: Paint()
                                          //   ..style = PaintingStyle.stroke
                                          //   ..strokeWidth = 6
                                          //   ..color = Colors.black
                                        ),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        // onTap: () {
                        //   setState(() {
                        //     widget.onpressedfavarite = true;
                        //   });
                        // },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.favorite,
                                color: /* widget.isavailable ?*/
                                    Colors.red /*: Colors.black,*/
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
