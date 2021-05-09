import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void validator() {
    final FormState _form = _formKey.currentState;
    if (_form.validate()) {
      print("yes");
    } else {
      print("no");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
              child: Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    Container(
                        height: 200,
                        color: Colors.blue,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text("Register",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 350,
                        width: double.infinity,
                        color: Colors.blue,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value.length < 6) {
                                  return "User is too short";
                                } else if (value == "") {
                                  return "Please Fill up UseeName";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                hintText: "UserName",
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == "") {
                                  return "Please Fill Email";
                                } else if (!regExp.hasMatch(value)) {
                                  return " Email is invlide ";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            TextFormField(
                              obscureText: obserText,
                              validator: (value) {
                                if (value == "") {
                                  return "please enter your Password";
                                } else if (value.length < 8) {
                                  return "Password is to Short ";
                                } else {
                                  return "";
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.phone),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obserText = !obserText;
                                    });
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Icon(
                                      obserText == true
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black),
                                ),
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == "") {
                                  return "please Fill Phone NUmber";
                                } else if (value.length < 11) {
                                  return "Phone Number is to short or to long ";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            Container(
                              height: 45,
                              width: double.infinity,
                              child: RaisedButton(
                                  child: Text("Registration"),
                                  color: Colors.blueGrey[400],
                                  onPressed: () {
                                    validator();
                                  }),
                            ),
                            Row(
                              children: <Widget>[
                                Text("Already have an Account?"),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  child: Text(
                                    "login",
                                    style: TextStyle(
                                      color: Colors.cyan,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ])))),
    ));
  }
}
