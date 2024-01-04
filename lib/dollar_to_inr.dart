import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/loginProvider.dart';
import 'package:untitled3/loginScreen.dart';
import 'package:untitled3/models/user_models.dart';
import 'NavBar.dart';

UserModel? userModel;

class DollarToINR extends StatefulWidget {
  var CurrencyValue;
  var name ;
   DollarToINR({super.key,this.CurrencyValue = 0.0,this.name = "inr"});

  @override
  State<DollarToINR> createState() => _DollarToINRState();
}

class _DollarToINRState extends State<DollarToINR> {

  // Get User Data In Profile
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


  //create controller for dollar
  TextEditingController dollarController = TextEditingController();
  //creating the varibale to store the inr value
  double inr = 0.0;
  double currValue = 0.0;
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
        title: Text('Dollar to inr Converter'),
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
              controller: dollarController,
              //some box around text field
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                //labele text
                labelText: 'Enter Dollar',
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

                setState(() {
                  inr = double.parse(dollarController.text) * double.parse(widget.CurrencyValue.toString());
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
              "${widget.name}: $inr",
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