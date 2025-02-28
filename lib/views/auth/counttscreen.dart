import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/auth/loginscreen.dart';
import 'package:flutter/material.dart';

class Counttscreen extends StatelessWidget {
  List<String> counties = [
    "Nyandarua",
    "Bungoma",
    "Nairobi",
    "KIsumu",
    "Kisii",
    "Trans-nzoia",
    "Homa-Bay",
    "Kiambu",
    "Mombasa",
    "Nyeri",
    "Nanyuki",
    "Mandera",
    "Turkana",
    "Kakamega",
    "Vihiga",
    'Uasin-Gishu',
    "Nakuru",
    "Meru",
    "Malindi"
  ];

  Counttscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        centerTitle: true,
        title: Text("Select country"),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: counties.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return login();
                    }));
                  },
                  leading: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text("${counties[index]}"),
                );
              })
        ],
      )),
    );
  }
}
