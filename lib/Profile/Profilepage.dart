import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/button_style.dart';
import 'package:untitled3/dollar_to_inr.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;
  TextEditingController username = TextEditingController(text: userModel!.username);
  TextEditingController useremail = TextEditingController(text: userModel!.useremail);

  Widget textField({required hintext}) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: ListTile(
        leading: Text(hintext),
      ),
    );
  }

  Widget nonEditField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
              radius: 80,
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        textField(hintext: userModel!.username),
        SizedBox(
          height: 20,
        ),
        textField(hintext: userModel!.useremail),
      ],
    );
  }

  Widget EditField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
              radius: 80,
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        TextFormField(
          controller: username,
          decoration: InputDecoration(hintText: userModel!.username),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: useremail,
          decoration: InputDecoration(hintText: userModel!.useremail),
        ),
        SizedBox(
          height: 30,
        ),
        StyledButton(
          onPressed: () {
            updateProfile();
          },
          text: "Update",
        )
      ],
    );
  }

  Future updateProfile() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "Fullname": username.text,
      "Email": useremail.text,
    }).then(
          (value) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DollarToINR()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define your gradient colors
    List<Color> gradientColors = [
      Color(0xfffcfdff),
      Color(0xff253f96),
    ];

    // Create a LinearGradient
    LinearGradient gradient = LinearGradient(
      colors: gradientColors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Scaffold(
      appBar: AppBar(
        leading: isEdit
            ? IconButton(
          onPressed: () {
            setState(() {
              isEdit = false;
            });
          },
          icon: Icon(Icons.close),
        )
            : IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = true;
              });
            },
            icon: Icon(Icons.edit),
          ),
        ],
        title: Text('Edit Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                isEdit ? EditField() : nonEditField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
