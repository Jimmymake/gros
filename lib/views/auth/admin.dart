// import 'package:Matrix.sc/admindashboard/mainscreen.dart';
// import 'package:Matrix.sc/constants/constants.dart';
// import 'package:Matrix.sc/views/buyers/main_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// class Admin extends StatefulWidget {
//   const Admin({super.key});

//   @override
//   State<Admin> createState() => _AdminState();
// }

// class _AdminState extends State<Admin> {
//   final _formkey = GlobalKey<FormState>();

//   TextEditingController _Emailcontroller = TextEditingController();
//   TextEditingController _Passwordcontroller = TextEditingController();

//   bool _ispasswordvisible = false;

//   String _email = "";
//   String _password = "";

//   bool _isloading = false;

//   loginadmin() {
//     FirebaseFirestore.instance.collection("admin").get().then((snapshot) {
//       snapshot.docs.forEach((element) {
//         if (element.data()["email"] == _Emailcontroller.text.trim() &&
//             element.data()["password"] == _Passwordcontroller.text.trim()) {
//           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               backgroundColor: Colors.green,
//               content: Text("logeed in sussesfully")));
//           Route route = MaterialPageRoute(builder: (context) {
//             return adminmainscreen();
//           });
//           Navigator.pushReplacement(context, route);
//         } else if (element.data()["email"] != _Emailcontroller.text.trim() ||
//             element.data()["email"] != _Passwordcontroller.text.trim()) {
//           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               backgroundColor: Colors.red,
//               content: Text("username or password is not correct")));
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenheight = MediaQuery.of(context).size.height;
//     return Container(
//       height: screenheight * 0.6,
//       child: Column(
//         children: [
//           Text(
//             "Admin",
//             style: TextStyle(
//                 color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               validator: (_email) {
//                 if (_email == null || _email.isEmpty) {
//                   return "Please enter your email";
//                 }
//                 return null;
//               },
//               controller: _Emailcontroller,
//               maxLines: 1,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.email), labelText: "Enter Email"),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               validator: (_password) {
//                 if (_password == null || _password.isEmpty) {
//                   return "Please Enter password";
//                 }
//                 return null;
//               },
//               obscureText: !_ispasswordvisible,
//               controller: _Passwordcontroller,
//               maxLines: 1,
//               keyboardType: TextInputType.visiblePassword,
//               decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.password),
//                   labelText: "Enter Password",
//                   suffixIcon: IconButton(
//                       padding: EdgeInsetsDirectional.only(end: 12),
//                       onPressed: () {
//                         setState(() {
//                           _ispasswordvisible = !_ispasswordvisible;
//                         });
//                       },
//                       icon: Icon(_ispasswordvisible
//                           ? Icons.visibility
//                           : Icons.visibility_off))),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: primarycolor,
//                   fixedSize: Size(250, 55),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   )),
//               onPressed: () {
//                 if (_formkey.currentState!.validate()) {
//                   loginadmin();
//                   setState(() {
//                     _email = _Emailcontroller.text;
//                     _password = _Passwordcontroller.text;
//                     _isloading = true;
//                   });
//                 }
//               },
//               child: _isloading
//                   ? CircularProgressIndicator(
//                       color: Colors.white,
//                     )
//                   : Text(
//                       "Log In",
//                       style: TextStyle(letterSpacing: 4),
//                     )),
//           SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
