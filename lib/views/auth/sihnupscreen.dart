
import 'dart:typed_data';
import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/auth/firebasedatabase.dart';
import 'package:Matrix.sc/views/Pages/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation? animation;
  // Tween<double>? animationtween;
  // Listenable? animations;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget) {
          return Scaffold(
            body: Transform(
              transform:
                  Matrix4.translationValues(animation!.value * width, 0.0, 0.0),
              child: Text("erer"),
            ),
          );
        });
  }
}

class Sihnupscreen extends StatefulWidget {
  const Sihnupscreen({super.key});

  @override
  State<Sihnupscreen> createState() => _SihnupscreenState();
}

class _SihnupscreenState extends State<Sihnupscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation? animation;
  Animation? delayedanimation;
  Animation? muchdelayedanimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
////////////
    animation = Tween(begin: -5.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn
            // Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            ));
///////////
    delayedanimation = Tween(begin: -5.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0)));
    _controller.forward();
    ///////
    muchdelayedanimation = Tween(begin: -5.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));
  }

  // @override
  // void dispose() {

  //   super.dispose();
  // }
  Uint8List? _image;
  //   final FirebaseStorage _storage = FirebaseStorage.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();
  bool _isloading = false;

  String _email = "";
  String _name = "";
  String _phonenumber = "";

  String _password = "";
  bool _ispasswordvisible = false;

  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Namecontroller = TextEditingController();
  TextEditingController _Phonenumbercontoller = TextEditingController();
  TextEditingController _Passwordcontroller = TextEditingController();
  TextEditingController _confirmepassword = TextEditingController();

  @override
  void dispose() {
    _Emailcontroller.dispose();
    _Namecontroller.dispose();
    _Phonenumbercontoller.dispose();
    _Passwordcontroller.dispose();
    _confirmepassword.dispose();
    _controller.dispose();
    super.dispose();
  }

  signinuser() async {
    try {
      setState(() {
        _isloading = true;
      });
      // EasyLoading.show(status: "uploading....");
      // _uploadBannerstoStorage(_image);
      // EasyLoading.show(status: "uploading....");
      // String imageurl = await _uploadprofiletoStorage(_image);
      String _collectionname = "usercollection";
      String _userid = randomAlphaNumeric(25);
      Map<String, dynamic> _userdetails = {
        "Email": _Emailcontroller.text,
        "Name": _Namecontroller.text,
        "phonenumber": _Phonenumbercontoller.text,
        // "profile": imageurl
      };

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      databasefunctions()
          .adduserdetails(_userdetails, _userid, _collectionname);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text("logged in succsesfully")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainScreen();
      }));

      // EasyLoading.dismiss();
      // EasyLoading.showToast("Creadatials uploaded sussesfully");
      //     .whenComplete(() {

      // }

      // )

      setState(() {
        _isloading = false;
      });
      EasyLoading.showToast("logged in sussefully",
          duration: Duration(seconds: 1));
    } on FirebaseException catch (err) {
      if (err.code == "weak-password") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Your password is weak")));
        setState(() {
          _isloading = false;
        });
      } else if (err.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
                "The email address is already in use by another account")));
        setState(() {
          _isloading = false;
        });
      } else if (err.code == "invalid-email") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("The email address is badly formatted")));
        setState(() {
          _isloading = false;
        });
      } else {
        setState(() {
          _isloading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Something Went Wrong")));

        print("errorcode.....: ${err.code}");
        print("error.....: ${err}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget) {
          return Scaffold(
            // extendBodyBehindAppBar: true,
            body: Form(
              key: _formkey,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: ListView(
                    shrinkWrap: true, primary: false,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(
                            animation!.value * width, 0.0, 0.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Matrix.S.c",
                                style: GoogleFonts.robotoSerif(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                    color: primarycolor),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                        colors: [Colors.black, primarycolor],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight)
                                    .createShader(bounds);
                              },
                              child: Image.asset(
                                "assets/icon/icon.png",
                                width: 100,
                                height: 70,
                              ),
                            ),
                          ],
                        ),
                      ),




                      /////

                      // SizedBox(
                      //   height: 15,
                      // ),

                      Container(
                        height: screenheight * 0.8,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            // Sighnup()
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: screenheight * 0.7,
                                    child: Column(
                                      children: [
                                        Transform(
                                          transform: Matrix4.translationValues(
                                              delayedanimation!.value * width,
                                              0.0,
                                              0.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Create Customer Account",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  validator: (_email) {
                                                    if (_email == null ||
                                                        _email.isEmpty) {
                                                      return "Please enter your email";
                                                    }
                                                    return null;
                                                  },
                                                  controller: _Emailcontroller,
                                                  maxLines: 1,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration: InputDecoration(
                                                      prefixIcon:
                                                          Icon(Icons.email),
                                                      labelText: "Enter Email"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  validator: (_name) {
                                                    if (_name == null ||
                                                        _name.isEmpty) {
                                                      return "Please Enter Name";
                                                    }
                                                    return null;
                                                  },
                                                  maxLines: 1,
                                                  controller: _Namecontroller,
                                                  decoration: InputDecoration(
                                                      prefixIcon:
                                                          Icon(Icons.person),
                                                      labelText:
                                                          "Enter Full Name"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  validator: (_Phonenumber) {
                                                    if (_Phonenumber == null ||
                                                        _Phonenumber.isEmpty) {
                                                      return "Please enter your email";
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  controller:
                                                      _Phonenumbercontoller,
                                                  maxLines: 1,
                                                  maxLength: 10,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          "Enter Phone Number",
                                                      prefixIcon: Icon(Icons
                                                          .phone_callback)),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  validator: (_password) {
                                                    if (_password == null ||
                                                        _password.isEmpty) {
                                                      return "Please Enter password";
                                                    }
                                                    return null;
                                                  },
                                                  obscureText:
                                                      !_ispasswordvisible,
                                                  controller:
                                                      _Passwordcontroller,
                                                  maxLines: 1,
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  decoration: InputDecoration(
                                                      prefixIcon:
                                                          Icon(Icons.password),
                                                      labelText:
                                                          "Enter Password",
                                                      suffixIcon: IconButton(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .only(
                                                                      end: 12),
                                                          onPressed: () {
                                                            setState(() {
                                                              _ispasswordvisible =
                                                                  !_ispasswordvisible;
                                                            });
                                                          },
                                                          icon: Icon(
                                                              _ispasswordvisible
                                                                  ? Icons
                                                                      .visibility
                                                                  : Icons
                                                                      .visibility_off))),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  validator: (_password) {
                                                    if (_password == null ||
                                                        _password.isEmpty) {
                                                      return "Please Confirme password";
                                                    }
                                                    return null;
                                                  },
                                                  obscureText:
                                                      !_ispasswordvisible,
                                                  controller: _confirmepassword,
                                                  maxLines: 1,
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  decoration: InputDecoration(
                                                      prefixIcon:
                                                          Icon(Icons.password),
                                                      labelText:
                                                          "Confirme Password",
                                                      suffixIcon: IconButton(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .only(
                                                                      end: 12),
                                                          onPressed: () {
                                                            setState(() {
                                                              _ispasswordvisible =
                                                                  !_ispasswordvisible;
                                                            });
                                                          },
                                                          icon: Icon(
                                                              _ispasswordvisible
                                                                  ? Icons
                                                                      .visibility
                                                                  : Icons
                                                                      .visibility_off))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        /////////////////////////////////////
                                        Transform(
                                          transform: Matrix4.translationValues(
                                              muchdelayedanimation!.value *
                                                  width,
                                              0.0,
                                              0.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              primarycolor,
                                                          fixedSize:
                                                              Size(250, 55),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          )),
                                                  onPressed: () {
                                                    if (_formkey.currentState!
                                                            .validate() &&
                                                        _Passwordcontroller
                                                                .text ==
                                                            _confirmepassword
                                                                .text) {
                                                      signinuser();
                                                      setState(() {
                                                        _email =
                                                            _Emailcontroller
                                                                .text;
                                                        _name = _Namecontroller
                                                            .text;
                                                        _phonenumber =
                                                            _Phonenumbercontoller
                                                                .text;
                                                        _password =
                                                            _Passwordcontroller
                                                                .text;
                                                      });
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          backgroundColor:
                                                              Colors.red,
                                                          content: Text(
                                                              "Passwords do not match."),
                                                          duration: Duration(
                                                              seconds: 3),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: _isloading
                                                      ? CircularProgressIndicator(
                                                          color: Colors.white,
                                                        )
                                                      : Text(
                                                          "Regester",
                                                          style: TextStyle(
                                                              letterSpacing: 4,
                                                              color:
                                                                  Colors.white),
                                                        )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Spacer(),
                                                    Text(
                                                        "Already have an account"),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Log In",
                                                      ),
                                                    ),
                                                    Spacer()
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
    // Scaffold(
    //         body:
    //         Column(
    //           children: [
          
    //           ],

    //         ),
    //       );