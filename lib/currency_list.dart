import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/NavBar.dart';
import 'package:untitled3/dollar_to_inr.dart';
import 'package:untitled3/loginScreen.dart';
import 'package:untitled3/models/user_models.dart';
import 'package:untitled3/service.dart';

class Currencylist extends StatefulWidget {
  @override
  State<Currencylist> createState() => _CurrencylistState();
}

class _CurrencylistState extends State<Currencylist> {
  List currencies = [];

  initialization() async {
    currencies = await Services().getCurrencies();
    setState(() {});
  }

  @override
  void initState() {
    initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => loginScreen(),
                      ),
                    ),
                  );
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
        title: Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
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
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Currency List Page',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemCount: currencies.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final currency = currencies[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DollarToINR(CurrencyValue: currency['value'],name: currency['code'],)));
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          '${currency['code']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Value: ${currency['value']}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
