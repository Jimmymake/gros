import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/electronics.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/productdetail.dart';
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class Categorycard extends StatelessWidget {
  final String imageurl;
  final String categoryname;
  Categorycard({super.key, required this.imageurl, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        transitionDuration: Duration(milliseconds: 700),
        closedColor: Colors.white,
        openElevation: 0,
        closedElevation: 0,
        openBuilder: (context, _) {
          return electronics();
          // Productdetail(
          //   categoryname: widget.categoryname,
          //   imageurl: widget.imageurl,
          //   productname: widget.productname,
          //   price: widget.price,
          //   description: widget.description,
          //   // onpressedfavarite: widget.onpressedfavarite,
          //   // rating: widget.rating,
          //   // discountpercentage: widget.discountpercentage,
          //   // isavailable: widget.isavailable,
          // );++
        },
        transitionType: ContainerTransitionType.fadeThrough,
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
                                    imageUrl: imageurl,
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
                                  categoryname,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontFamily: "Brand-Bold"),
                                ),
                              ),
                            ),
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
