import 'dart:typed_data';

import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/auth/loginscreen.dart';
// import 'package:Matrix.sc/views/auth/sighnup.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/account/aboutus.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/account/privacypolicy.dart';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/account/termsandservises.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// class login extends StatefulWidget {
//   const login({super.key});

//   @override
//   State<login> createState() => _loginState();
// }

// class _loginState extends State<login> with SingleTickerProviderStateMixin {

//   }
// }

//
//////////////////////////////////////////////////
// AnimatedBuilder(
//         animation: _controller,
//         builder: (BuildContext context, Widget) {
//           return Scaffold(
//               body: Transform(
//                   transform: Matrix4.translationValues(
//                       animation!.value * width, 0.0, 0.0),child: Text("erer"),),);
//         });


//////////////////parenting
class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  var _image;

  pickprofilemage(ImageSource source) async {
    final ImagePicker _imagepicker = ImagePicker();
    XFile? _file = await _imagepicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print("no image selected");
    }
  }

  selectgalleryimage() async {
    Uint8List? im = await pickprofilemage(ImageSource.gallery);
    setState(() {
      im = _image;
    });
  }

  selectcameraimage() async {
    Uint8List? im = await pickprofilemage(ImageSource.camera);
    setState(() {
      im = _image;
    });
  }

  logoutmethod() async {
    try {
      await FirebaseAuth.instance.signOut();

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return login();
      }));
    } on FirebaseException catch (err) {
      throw Exception("sign out...error: $err");
    }
  }

  late AnimationController _controller;
  Animation? animation;
  Animation? childanimation;

  // Tween<double>? animationtween;
  // Listenable? animations;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: -0.25, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    childanimation = Tween(begin: 30.0, end: 125.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        centerTitle: true,
        title: Text("Account"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // AnimatedBuilder(
              //     animation: _controller,
              //     builder: (BuildContext context, child) {
              //       return Transform(
              //         transform: Matrix4.translationValues(
              //             animation!.value * width, 0.0, 0.0),
              //         child: Container(
              //           height: 100,
              //           width: MediaQuery.of(context).size.width,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.vertical(
              //                   bottom: Radius.elliptical(
              //                       MediaQuery.of(context).size.width, 100)),
              //               color: primarycolor),
              //         ),
              //       );
              //     }),
              Column(
                children: [
                  //     return Scaffold(
                  //       appBar: AppBar(title: Text("User Profile")),
                  //       body: ListView(children: providerDetails),
                  //     );
                  //   },
                  // ),
        
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Text(
                  //   "Name",
                  //   style: TextStyle(color: Colors.white70, fontSize: 30),
                  // ),
        
                  const SizedBox(
                    height: 30,
                  ),
                  // Material(
                  //   elevation: 2,
                  //   borderRadius: BorderRadius.circular(70),
                  //   child: const CircleAvatar(
                  //     backgroundImage:     _,
                  //     radius: 70,
                  //     backgroundColor: Colors.black,
                  //   ),
                  // ),
        
                  GestureDetector(
                    onTap: () async {
                      // Trigger image picker
        
                      selectgalleryimage();
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(70),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.black,
                        backgroundImage: _image != null
                            ? MemoryImage(_image!)
                            : null,
                        child: _image == null
                            ? Icon(Icons.camera_alt,
                                size: 50, color: Colors.white)
                            : null, // Display an icon if no image is selected
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  // ListTile(
                  //     leading: Icon(
                  //       Icons.person_2_outlined,
                  //       size: 25,
                  //     ),
                  //     title: Text(
                  //       "Name",
                  //     ),
                  //     subtitle: Text(
                  //       "JImmy Barasa",
                  //     )),
                  // Divider(),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("usercollection")
                        .where("Email".trim(),
                            isEqualTo: FirebaseAuth
                                .instance.currentUser?.email)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print("Error: ${snapshot.error}");
                        return Text('Error fetching data');
                      }
        
                      if (snapshot.hasData) {
                        print(
                            "data........................'${FirebaseAuth.instance.currentUser?.email}'");
                        // Check if there are any documents
                        if (snapshot.data!.docs.isEmpty) {
                          print("No documents found!");
                          return Text('No matching documents');
                        }
        
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final document =
                                snapshot.data!.docs[index];
        
                            return ListTile(
                              leading: Icon(Icons.person),
                              title: Text(document["Name"]),
                              subtitle: Text(document["Email"]),
                            );
                          },
                        );
                      }
        
                      return CircularProgressIndicator();
                    },
                  ),
        
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.file_copy,
                      size: 25,
                    ),
                    title: Text(
                      "Terms and condtions",
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Termsandservises();
                      }));
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.person_4_rounded,
                      size: 25,
                    ),
                    title: Text(
                      "about as",
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Aboutus();
                      }));
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.question_mark_outlined,
                      size: 25,
                    ),
                    title: Text(
                      "Privacy policy",
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Privacypolicy();
                      }));
                    },
                  ),
                  Divider(),
                  ListTile(
                      onTap: () {
                        setState(() {
                          logoutmethod();
                        });
                      },
                      leading: Icon(
                        Icons.logout_outlined,
                        size: 25,
                      ),
                      title: Text(
                        "Log Out",
                      )),
                  Divider(),
        
                  // AnimatedBuilder(
                  //     animation: _controller,
                  //     builder: (BuildContext context, child) {
                  //       return Transform(
                  //         transform: Matrix4.translationValues(
                  //             animation!.value * width, 0.0, 0.0),
                  //         child: Container(
                  //           height: childanimation!.value * 2,
                  //           width: childanimation!.value * 2,
                  //           color: primarycolor,
                  //         ),
                  //       );
                  //     }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
///////////////////////////////////////////////////////////////////
// class account extends StatefulWidget {
//   // Sighnup auth = Sighnup(
//   //   auth: FirebaseAuth.instance,
//   // );

//   final currentuser = FirebaseAuth.instance;
//   account({super.key});

//   @override
//   State<account> createState() => _accountState();
// }

// class _accountState extends State<account> {
 
//   @override
//   Widget build(BuildContext context) {
//     // print(
//     //     "data........................'${Firebase uth.instance.currentUser?.email}'"
//     //     );

//     return Scaffold(
     
//       body:
//     );
//   }
// }
