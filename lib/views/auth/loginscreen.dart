// import 'package:Matrix.sc/constants/constants.dart';
// import 'package:Matrix.sc/views/auth/forgotpassword.dart';
// import 'package:Matrix.sc/views/auth/sihnupscreen.dart';
// import 'package:Matrix.sc/views/buyers/main_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:google_fonts/google_fonts.dart';

// class login extends StatefulWidget {
//   const login({super.key});

//   @override
//   State<login> createState() => _loginState();
// }

// class _loginState extends State<login> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   Animation? animation;
//   // Tween<double>? animationtween;
//   // Listenable? animations;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 2));
//     animation = Tween(begin: -1.0, end: 0.0).animate(
//         CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     return AnimatedBuilder(
//         animation: _controller,
//         builder: (BuildContext context, Widget) {
//           return Scaffold(
//               body: Transform(
//                   transform: Matrix4.translationValues(
//                       animation!.value * width, 0.0, 0.0),child: Text("erer"),),);
//         });
//   }
// }

import 'package:Matrix.sc/constants/constants.dart';
import 'package:Matrix.sc/views/auth/forgotpassword.dart';
import 'package:Matrix.sc/views/auth/sihnupscreen.dart';
import 'package:Matrix.sc/views/Pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> with SingleTickerProviderStateMixin {
  //  pickprofilemage(ImageSource source) async {
  //   final ImagePicker _imagepicker = ImagePicker();
  //   XFile? _file = await _imagepicker.pickImage(source: source);
  //   if (_file != null) {
  //     return await _file.readAsBytes();
  //   } else {
  //     print("no image selected");
  //   }
  // }

  // selectgalleryimage() async {
  //   Uint8List? im = await  pickprofilemage(ImageSource.gallery);
  //   setState(() {
  //     im = _image;
  //   });
  // }

  // selectcameraimage() async {
  //   Uint8List? im = await pickprofilemage(ImageSource.camera);
  //   setState(() {
  //     im = _image;
  //   });
  // }

  final _formkey = GlobalKey<FormState>();

  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Passwordcontroller = TextEditingController();

  bool _ispasswordvisible = false;

  String _email = "";
  String _password = "";

  bool _isloading = false;

  loginuser() async {
    try {
      setState(() {
        _isloading = true;
      });
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      print(
          "data........................'${FirebaseAuth.instance.currentUser?.email}'");
      Navigator.pushReplacement(
          context,
          (MaterialPageRoute(
            builder: (context) {
              return MainScreen();
            },
          )));
      setState(() {
        _isloading = false;
      });

      EasyLoading.showToast("logged in sussefully",
          duration: Duration(seconds: 1));
    } on FirebaseException catch (err) {
      // if (error == "channel-error") {
      if (err.code == "invalid-email") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("The email address is badly formatted")));
        setState(() {
          _isloading = false;
        });
      } else if (err.code == "invalid-credential") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("invalid email or password")));
        setState(() {
          _isloading = false;
        });
      } else if (err.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("email and password does not exist")));
        setState(() {
          _isloading = false;
        });
      } else if (err.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Wrong password provided")));
        setState(() {
          _isloading = false;
        });
      } else if (err.code == "user-disabled") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Email and passoword disabled")));
      } else if (err.code == "unknown") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("An error has occurred")));
        setState(() {
          _isloading = false;
        });
      } else if (err.code == "network-request-failed") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red, content: Text("Network Problem")));
        setState(() {
          _isloading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Something Went Wrong Try Again")));
        setState(() {
          _isloading = false;
        });
        print("errorcode.....: ${err.code}");
        print("error.....: ${err}");
      }
    }
  }

  late AnimationController _controller;
  Animation? animation;
  // Tween<double>? animationtween;
  // Listenable? animations;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = Tween(begin: -10, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
   
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     _controller.forward();
    double screenheight = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget) {
          return Scaffold(
            body: Transform(
              transform:
                  Matrix4.translationValues(animation!.value * width, 0.0, 0.0),
              child:
               SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Matrix.S.c",
                          style: GoogleFonts.robotoSerif(
                              fontStyle: FontStyle.italic,
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: primarycolor),
                        ),
                        SizedBox(
                          height: 20,
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
                            width: 200,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (_email) {
                              if (_email == null || _email.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                            controller: _Emailcontroller,
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: "Enter Email"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (_password) {
                              if (_password == null || _password.isEmpty) {
                                return "Please Enter password";
                              }
                              return null;
                            },
                            obscureText: !_ispasswordvisible,
                            controller: _Passwordcontroller,
                            maxLines: 1,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                labelText: "Enter Password",
                                suffixIcon: IconButton(
                                    padding:
                                        EdgeInsetsDirectional.only(end: 12),
                                    onPressed: () {
                                      setState(() {
                                        _ispasswordvisible =
                                            !_ispasswordvisible;
                                      });
                                    },
                                    icon: Icon(_ispasswordvisible
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primarycolor,
                                fixedSize: Size(250, 55),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                loginuser();
                                setState(() {
                                  _email = _Emailcontroller.text;
                                  _password = _Passwordcontroller.text;
                                  _isloading = true;
                                });
                              }
                            },
                            child: _isloading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Log In",
                                    style: TextStyle(
                                        letterSpacing: 4, color: Colors.white),
                                  )),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const forgotpassword();
                                }));
                              },
                              child: Text(
                                "Forgot password?",
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Spacer(),
                              Text("Don't have an account"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Sihnupscreen();
                                  }));
                                },
                                child: Text("Sign Up"),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

// //  final AuthController _authController =AuthControler();
// // final FirebaseAuth _authcontoller = FirebaseAuth.instance;

// class Loginscreen extends StatefulWidget {
//   const Loginscreen({super.key});

//   @override
//   State<Loginscreen> createState() => _LoginscreenState();
// }

// class _LoginscreenState extends State<Loginscreen> {


//   @override
//   Widget build(BuildContext context) {
 

//     return 
//     Scaffold(
//       body: 
//     );
//   }
// }
