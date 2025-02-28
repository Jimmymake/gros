import 'package:Matrix.sc/models/pickupstationmodel.dart';
import 'package:flutter/material.dart';

class ShippingAdress extends StatelessWidget {
  const ShippingAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shipping Address"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Pickupstation(
                    picmodel: pickupstationmodel(
                        Firstname: 'Jimmy',
                        lastname: "Mayeku",
                        phonenumber: "0717126550",
                        Pickupstation: "Riziiu Plaza ,Along Kimilili Road ")),
              ],
            ),
          ),
          Card(color: 
          Colors.redAccent,
            child: SizedBox(height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.add),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Text("Add adress")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
