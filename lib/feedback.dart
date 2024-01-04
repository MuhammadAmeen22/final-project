import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/NavBar.dart';
import 'package:untitled3/dollar_to_inr.dart';
import 'package:untitled3/loginScreen.dart';
import 'package:untitled3/models/user_models.dart';

class FeedBack extends StatefulWidget {
  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut().then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginScreen())));

              },
              icon: Icon(Icons.exit_to_app)
          )
        ],
        title: Text('FeedBack'),
      ),
      body: Center(
        child: Text(
          'FeedBack Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}



