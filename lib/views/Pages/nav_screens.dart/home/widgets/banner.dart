import 'package:Matrix.sc/views/Pages/nav_screens.dart/category/widgets/media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Bannerwidget extends StatefulWidget {
  @override
  State<Bannerwidget> createState() => _BannerwidgetState();
}

class _BannerwidgetState extends State<Bannerwidget> {



  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List _bannersnapimage = [];
  getbanneers() {
    return _firestore
        .collection("Banners")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _bannersnapimage.add(doc["imageurl"]);
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getbanneers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

final screenheight = MediaQuery.of(context).size.height;

    return AspectRatio(aspectRatio: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: PageView.builder(
              itemCount: _bannersnapimage.length,
              itemBuilder: (context, Index) {
                return ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: _bannersnapimage[Index],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CardLoading(
                      height: double.infinity,
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                );
              }),
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(10) ,
              // borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade900),
          height: screenheight *0.4,
          width: double.infinity,
        ),
      ),
    );
  }
}

