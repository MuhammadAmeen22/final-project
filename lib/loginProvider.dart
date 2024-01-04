import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dollar_to_inr.dart';
import 'loginScreen.dart';

class LoginProvider extends ChangeNotifier {
  // UserCredential? userCredential;
  bool loading = false;

  void LoginValidation(
      {required TextEditingController? email,
      required TextEditingController? password,
      required BuildContext context}) async {
    if (email!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password is empty!")));
    }
    if (password!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password is empty!")));
    }

    if (!RegExp(r"^[a-zA-Z0-9+_.-]+@").hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email format!")),
      );
    }

    if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password must be at least 8 characters long!")),
      );
    } else {
      try {
        loading = true;
        notifyListeners();
        FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) async {
          loading = false;
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DollarToINR()),
          );
        });
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        loading = true;
        notifyListeners();
        if (e.code == "user-not-found") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User does not exist!")),
          );
        } else if (e.code == "wrong-password") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Incorrect Password!")),
          );
        }
      }
    }
  }
}





