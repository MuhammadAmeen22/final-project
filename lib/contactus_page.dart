import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/NavBar.dart';
import 'package:untitled3/loginScreen.dart';

import 'button_style.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => loginScreen())));
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
        title: Text('Contact Us'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfff5f7fc),
                  Color(0xff5374e5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Your Name',
                          icon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Your Email',
                          icon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Your Phone no',
                          icon: Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          labelText: 'Your Message',
                          icon: Icon(Icons.message),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      StyledButton(
                        onPressed: () {},
                        text: "Submit",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
