// import 'package:flutter/material.dart';

// class Detail extends StatefulWidget {
//   const Detail({super.key});

//   @override
//   State<Detail> createState() => _DetailState();
// }

// class _DetailState extends State<Detail> {
//   int numberoditems = 1;
//   String imageulr =
//       "https://firebasestorage.googleapis.com/v0/b/grosaryapp-d67bf.appspot.com/o/category%2Fimage1.jpeg?alt=media&token=f835ba08-e30b-48e8-b94a-50bfdfb04290";
//   @override
//   Widget build(BuildContext context) {
// //     return Center(
// //       child: ProductCard(imageUrl: imageulr, categoryName: "cloth", productName: "Shirt", price: 34),
// //     );
// //   }
// // }

//     return Scaffold(
//       extendBodyBehindAppBar: false,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 height: 250,
//                 decoration: const BoxDecoration(),
//                 child: Image.network(
//                   imageulr,
//                   fit: BoxFit.fill,
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 250,
//                   child: Text(
//                     "Mediterranean Chickpea Salad",
//                   ),
//                 ),
//                 const Spacer(),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (numberoditems > 1) {
//                         numberoditems = numberoditems - 1;
//                       }
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(5)),
//                     child: const Icon(
//                       Icons.remove,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   "$numberoditems",
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       numberoditems = numberoditems + 1;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadiusDirectional.circular(5)),
//                     child: const Icon(
//                       Icons.add,
//                       color: Colors.white,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             constraints: const BoxConstraints(maxWidth: 350),
//             child: Text(
//               "Larde descprion",
//               maxLines: 6,
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Row(
//             children: [
//               Text(
//                 "Delivery Time",
//               ),
//               const SizedBox(
//                 width: 15,
//               ),
//               const Icon(Icons.alarm),
//               Text(
//                 "30 mins",
//               )
//             ],
//           ),
//           const Spacer(),
//           Row(
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "Total Price",
//                   ),
//                   Text(
//                     "\$28",
//                   )
//                 ],
//               ),
//               const Spacer(),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Add TO Cart",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(
//                         width: 15,
//                       ),
//                       Icon(
//                         Icons.shopping_cart_outlined,
//                         color: Colors.white,
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
