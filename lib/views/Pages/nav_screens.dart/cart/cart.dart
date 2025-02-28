
import 'package:Matrix.sc/cartprovider.dart';
import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/listtilewidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String? selectedpickupstation;
  String? selectedpaymentmethod;

  @override
  Widget build(BuildContext context) {
    bool ifmpesa = selectedpaymentmethod == "M-pesa";
    Widget? myfunc() {
      Widget? mywidet;
      if (selectedpaymentmethod == "M-pesa") {
        print("mpesaaaaaaaaaaa");
        mywidet = Container(
          decoration: BoxDecoration(
              // border: Border.all(
              //   width: 0.5,
              // ),
              borderRadius: BorderRadius.circular(5)),
          height: 140,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  height: 65,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        fit: BoxFit.fill,
                        "assets/icons/MicrosoftTeams-image_41.png",
                        width: 20,
                      ))),
              SizedBox(
                height: 5,
              ),
              // Divider(),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1)),
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: "0700012345"),
              )
            ],
          ),
        );
      } else if (selectedpaymentmethod == "Pay-On delivery") {
        print("pay on deleveryyyyyyyyyy");
        mywidet = Text(
          "Pay on Delivery",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        );
      } else {
        null;
      }
      return mywidet;
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: iconcolor),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
              builder: (context, value, child) => Badge(
                  label: Text("${value.mylist.length}"),
                  child: Icon(Icons.shopping_cart))),
          SizedBox(
            width: 15,
          )
        ],
        title: Text("Cart"),
        backgroundColor: primarycolor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<CartProvider>(
                        builder: (context, consumervalue, child) => Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: consumervalue.mylist.length,
                              itemBuilder: (context, index) {
                                bool ismylistempty =
                                    consumervalue.mylist.isEmpty;
                                return ismylistempty
                                    ? Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Add item",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 34),
                                        ))
                                    : Listtilewidget(
                                        card: consumervalue.mylist[index]);
                              },
                            ),

                            Divider(),
                            ListTile(
                              titleAlignment: ListTileTitleAlignment.top,
                              title: Row(
                                children: [
                                  Icon(Icons.maps_home_work_rounded),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Pickup Station"),
                                ],
                              ),
                              subtitle: Expanded(
                                child: Container(
                                  height: 80,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: const Text('Select pickupsation'),
                                      value: selectedpickupstation,
                                      items: [
                                        "Pickup-G4S Ronald Ngala ST Next To Barngetung Plaza,Eldoret Town",
                                        "Zaion Mall shop 5,Eldoret Town"
                                      ]
                                          .map((currency) => DropdownMenuItem(
                                                value: currency,
                                                child: Text(
                                                    currency.toUpperCase()),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedpickupstation = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              // trailing: ,Icon(Icons.pending),
                            ),

                            Divider(),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Payment Method",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.security,
                                        size: 15,
                                      ),
                                      Text(" 100% Money Back Guarantee"),
                                    ],
                                  ),
                                ],
                              ),
                              subtitle: Expanded(
                                child: Container(
                                  height: 80,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: const Text('Select Payment Method'),
                                      value: selectedpaymentmethod,
                                      items: ["M-pesa", "Pay-On delivery"]
                                          .map((currency) => DropdownMenuItem(
                                                value: currency,
                                                child: Text(
                                                    currency.toUpperCase()),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedpaymentmethod = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // Text.rich(TextSpan(children: [TextSpan(text: "Payment Method",), TextSpan(text: ),]))
                            // PopupMenuButton<String>(
                            //     icon: Icon(Icons.kebab_dining),
                            //     offset: Offset(0, 40),
                            //     onSelected: (value) {
                            //       if (value == "1") {
                            //       } else {
                            //         print("object 2");
                            //       }
                            //       // Handle the selected optifion
                            //       print("You selected: $value");
                            //     },
                            //     itemBuilder: (BuildContext context) => [
                            //       PopupMenuItem(
                            //         value: "1",
                            //         child: Text("Surface Tripping"),
                            //       ),
                            //       PopupMenuItem(
                            //         value: "Option 2",
                            //         child: Text("Packaging and Prosessing"),
                            //       ),
                            //     ],
                            //   ),

                            Divider(),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myfunc(),
                            ),

                            // Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: ifmpesa
                            //         ? Container(
                            //             decoration: BoxDecoration(
                            //                 // border: Border.all(
                            //                 //   width: 0.5,
                            //                 // ),
                            //                 borderRadius:
                            //                     BorderRadius.circular(5)),
                            //             height: 140,
                            //             width: double.infinity,
                            //             child: Column(
                            //               children: [
                            //                 Container(
                            //                     decoration: BoxDecoration(
                            //                         border: Border.all(
                            //                           width: 0.5,
                            //                         ),
                            //                         borderRadius:
                            //                             BorderRadius.circular(
                            //                                 10)),
                            //                     height: 65,
                            //                     width: double.infinity,
                            //                     child: ClipRRect(
                            //                         borderRadius:
                            //                             BorderRadius.circular(
                            //                                 10),
                            //                         child: Image.asset(
                            //                           fit: BoxFit.fill,
                            //                           "assets/icons/MicrosoftTeams-image_41.png",
                            //                           width: 20,
                            //                         ))),
                            //                 SizedBox(
                            //                   height: 5,
                            //                 ),
                            //                 // Divider(),
                            //                 TextFormField(
                            //                   keyboardType: TextInputType.phone,
                            //                   decoration: InputDecoration(
                            //                       border: OutlineInputBorder(
                            //                           borderRadius:
                            //                               BorderRadius.circular(
                            //                                   10),
                            //                           borderSide:
                            //                               BorderSide(width: 1)),
                            //                       labelStyle: TextStyle(
                            //                           color: Colors.grey),
                            //                       labelText: "0700012345"),
                            //                 )
                            //               ],
                            //             ),
                            //           )
                            //         : Text(
                            //             "Pay on Delivery",
                            //             style: TextStyle(
                            //                 fontSize: 30,
                            //                 fontWeight: FontWeight.bold),
                            //           )),
                            // mpesa(),
                            // ListTile(
                            //     contentPadding: EdgeInsets.all(0),
                            //     title: SizedBox(
                            //         height: 65,
                            //         width: 100,
                            //         child: ClipRRect(
                            //             borderRadius: BorderRadius.circular(10),
                            //             child: Image.asset(
                            //               fit: BoxFit.fill,
                            //               "assets/icons/pngwing.com.png",
                            //               width: 20,
                            //             )))),
                            // Divider()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<CartProvider>(
              builder: (context, consumervalue, child) => SizedBox(
                height: 66,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "Total Ksh: ${consumervalue.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 200,
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () {
                            if (selectedpickupstation != null) {
                              if (selectedpaymentmethod != null) {
                                if (consumervalue.price == 0.0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text("No item selected")));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text(
                                              "Your order has been placed")));
                                }
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              "Select payment method")));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text("Select pickupstation")));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: primarycolor),
                          child: Text(
                            "Place Order",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
