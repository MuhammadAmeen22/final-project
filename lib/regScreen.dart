import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/regProvder.dart';
import 'button_style.dart';
import 'loginScreen.dart';

class RegScreen extends StatefulWidget {
  @override
  State<RegScreen> createState() => _SignupPageState();
}

class _SignupPageState extends State<RegScreen> {

  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool visibility = false;
  bool confirmvisibility = false;

  @override
  Widget build(BuildContext context) {
    regProvider signupProvider = Provider.of<regProvider>(context);

    return Scaffold(
        body: Stack(
      //thanks for watching
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
              'Create Your\nAccount',
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
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                    controller: fullname,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        label: Text(
                          'Full Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff101113),
                          ),
                        )),
                  ),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        label: Text(
                          'Phone or Gmail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff101113),
                          ),
                        )),
                  ),
                  TextField(
                    controller: password,
                    obscureText: !visibility, // Added obscureText property
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
                  TextField(
                    controller: confirmpassword,
                    obscureText:
                        !confirmvisibility, // Added obscureText property
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confirmvisibility = !confirmvisibility;
                            });
                          },
                          icon: Icon(
                            confirmvisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        label: Text(
                          'Conform Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff101113),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  signupProvider.loading == false
                      ? StyledButton(
                          onPressed: () {
                            signupProvider.SignupValidation(
                                fullname: fullname,
                                email: email,
                                password: password,
                                confirmpassword: confirmpassword,
                                context: context);
                          },
                          text: "SIGN UP")
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                  const SizedBox(
                    height: 65,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Already have account?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //on pressing dollar to INr we should navigate
                            //to the dollar_to_inr widget
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => loginScreen()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(

                                ///done login page
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
    ));
  }
}
