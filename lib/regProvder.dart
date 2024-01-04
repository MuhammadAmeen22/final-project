import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dollar_to_inr.dart';
import 'loginScreen.dart';

class regProvider extends ChangeNotifier{
  UserCredential? userCredential;
  bool loading = false;

  void SignupValidation({
    required TextEditingController fullname,
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController confirmpassword,
    required BuildContext context

  }) async {
    if(fullname.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Fullname is empty!"))

      );
    }
    if (!RegExp(r"^[a-zA-Z0-9+_.-]+@").hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email format!")),
      );
    }
    if(password.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password is empty!"))

      );
    }
    if(confirmpassword.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("ConfirmPassword is empty!"))

      );
    }

    if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password must be at least 8 characters long!")),
      );
    }
    else if (password.text != confirmpassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password and Confirm Password do not match!")),
      );
      return; // Stop execution if password and confirm password do not match
    }

    else {
      try{
        loading = true;
        notifyListeners();
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text,
            password: password.text);

        loading = true;
        notifyListeners();
        FirebaseFirestore.instance.collection("users").doc(userCredential!.user!.uid).set(
            {
              "Fullname": fullname.text,
              "Email": email.text,
              "password":password.text,
              "confirmpassword":confirmpassword.text,
              "userid": userCredential!.user!.uid
            }
        ).then((value) {
          loading = false;
          notifyListeners();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DollarToINR()),
          );
        });
      } on FirebaseAuthException catch (e) {
        loading = false;
        notifyListeners();
        if(e.code == "weak-password"){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Weak Password!")),
          );
        }
        else if(e.code == "email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email Already Exists!")),
          );
        }
      }
    }


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Signup successf0ully ")),
    );
  }
}
