import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String useremail;
  final String userpassword;
  final String userconfirmpassword;
  final String userid;

  UserModel(
      {required this.username,
      required this.useremail,
      required this.userpassword,
      required this.userconfirmpassword,
      required this.userid});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
        username: doc['Fullname'],
        useremail: doc['Email'],
        userpassword: doc['password'],
        userconfirmpassword: doc['password'],
        userid: doc['userid']);
  }
}
