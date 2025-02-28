import 'package:Matrix.sc/cartprovider.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/carddesighn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listtilewidget extends StatelessWidget {
  final carddesighn card;
  const Listtilewidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, consumervalue, child) => ListTile(
          leading: Container(
            width: 50,
            height: 50,
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: card.imageurl,
                fit: BoxFit.cover,
                placeholder: (context, url) => CardLoading(
                  height: double.infinity,
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          title: Title(color: Colors.black, child: Text(card.productname)),
          subtitle: Title(color: Colors.black, child: Text("${card.price}")),
          trailing: IconButton(
              onPressed: () {
                consumervalue.removeitem(card);
              },
              icon: Icon(Icons.delete))),
    );
  }
}
