import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/loginProvider.dart';
import 'package:untitled3/regScreen.dart';
import 'button_style.dart';
import 'dollar_to_inr.dart';
import 'inr_to_dollar.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff101113),
                Color(0xff253f96),
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Hello\nSign in!',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Gmail',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff101113),
                            ),
                          )),
                    ),
                    TextField(
                      controller: password,
                      obscureText: !visibility,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility = !visibility;
                              });
                            },
                            icon: Icon(
                              visibility
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          label: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff101113),
                            ),
                          )),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xff281537),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),

                    LoginProvider().loading == false
                        ? StyledButton(
                        onPressed: () {
                          loginProvider.LoginValidation(
                              email: email,
                              password: password,
                              context: context);
                        },
                        text: "SIGN IN")
                        : Center(
                      child: CircularProgressIndicator(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),

                    SizedBox(
                      height: 60,
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegScreen()));
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
