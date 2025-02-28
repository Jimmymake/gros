import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});

  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  TextEditingController emailcontroller = TextEditingController();

  bool _isloading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    emailcontroller.dispose();

    super.dispose();
  }

  final _formekey = GlobalKey<FormState>();

  String email = "";

  emailrecoveryfunc() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "An email with recovery link has been sent to your mailbox",
          )));

      setState(() {
        _isloading = false;
      });
      Navigator.pop(context);
    } on FirebaseException catch (err) {
      if (err.code == "missing-email") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "email you entered does not exist",
            )));
      } else if (err.code == "invalid-email") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "The email address is badly formatted.",
            )));
      }
      print("error:  $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formekey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: Colors.yellow.shade900),
                          child: Center(
                            child: Text(
                              "Forgot password",
                              style: TextStyle(fontSize: 27),
                            ),
                          ),
                        ),
                        Text(
                          " Enter your email",
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return "Please enter email";
                              }
                              return null;
                            },
                            controller: emailcontroller,
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "email@gmail.com",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formekey.currentState!.validate()) {
                                setState(() {
                                  email = emailcontroller.text;
                                  emailrecoveryfunc();
                                  _isloading = true;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(200, 50),
                                backgroundColor: Colors.yellow.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: _isloading
                                ? CircularProgressIndicator()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Send Reset link",
                                      ),
                                      Icon(Icons.arrow_forward_ios_sharp)
                                    ],
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
