// rate_alerts_page.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/NavBar.dart';
import 'package:untitled3/dollar_to_inr.dart';
import 'package:untitled3/loginScreen.dart';
import 'package:untitled3/models/user_models.dart';

class RateAlertsPage extends StatefulWidget {
  @override
  State<RateAlertsPage> createState() => _RateAlertsPageState();
}

class _RateAlertsPageState extends State<RateAlertsPage> {

  Future getUserData() async{
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((DocumentSnapshot doc){
      if(doc.exists){
        userModel = UserModel.fromDocument(doc);
      }
      else{
        print("User does not exists");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    getUserData();
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
        title: Text('Rate Alerts'),
      ),
      body: Center(
        child: Text(
          'Rate Alerts Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
