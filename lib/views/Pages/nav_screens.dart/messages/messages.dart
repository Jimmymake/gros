import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/soon.dart';
import 'package:flutter/material.dart';

class messages extends StatefulWidget {
  const messages({super.key});

  @override
  State<messages> createState() => _searchState();
}

class _searchState extends State<messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: primarycolor,
        title: Row(
          children: [
            Text("Message Center"),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Badge(label: Text("5"), child: Icon(Icons.message)))
          ],
        ),
      ),
      body: Expanded(
          child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.message),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            title: Text("Contact Us with Chart"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Soon();
              }));
            },
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Soon();
              }));
            },
            leading: Icon(Icons.volume_down),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            title: Text("System Message"),
          ),
          Divider(),
          ListTile(onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Soon();
              }));
          },
            leading: Icon(Icons.notes),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            title: Text("Order Updates"),
          ),
          Divider(),
          ListTile(onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Soon();
              }));
          },
            leading: Icon(Icons.card_giftcard),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            title: Text("Promotions"),
          ),
          Divider(),
          //  SizedBox(
          //     height: 20,
          //   ),
          // Container(
          //   decoration: BoxDecoration(color: Colors.white70),
          //   height: 120,
          //   width: double.infinity,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Align(
          //           alignment: Alignment.topLeft,
          //           child: Text("Chart with Sellers")),
          //       Row(
          //         children: [
          //           TextButton(onPressed: () {}, child: Text("Log in")),
          //           Text("and chart with sellers")
          //         ],
          //       )
          //     ],
          //   ),
          // )
        ],
      )),
    );
  }
}
