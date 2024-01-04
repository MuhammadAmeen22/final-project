import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'NavBar.dart';
import 'dollar_to_inr.dart';
import 'loginScreen.dart';
import 'models/user_models.dart';



class InrToDollar extends StatefulWidget {
  const InrToDollar({super.key});

  @override
  State<InrToDollar> createState() => _InrToDollarState();
}

class _InrToDollarState extends State<InrToDollar> {

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

  //create controller for inr
  TextEditingController inrController = TextEditingController();
  //creating the varibale to store the dollar value
  double dollar = 0.0;
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
        title: Text('Inr to Dollar Converter'),
      ),
      body: Container(
        //give some padding
        padding: EdgeInsets.all(20),
        //here we need to create
        //one text filed to take input form user
        //and one button
        //so we will use here column widget
        child: Column(
          children: [
            TextField(
              controller: inrController,
              //some box around text field
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                //labele text
                labelText: 'Enter Inr',
              ),
            ),
            //need some space between
            //textfield and button
            const SizedBox(
              height: 30,
            ),
            //create convert button
            ElevatedButton(
              onPressed: () {
                //on pressing the convert we
                //should convert the inr to dollar
                setState(() {
                  dollar = double.parse(inrController.text) * 0.012;
                });
              },
              child: Text("Convert"),
            ),
            //for some space between button and text
            SizedBox(
              height: 30,
            ),
            //now we have to show dollar on screen
            //so we will use here text widget
            Text(
              "Dollar : " + dollar.toString(),
              //increse some font size
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}