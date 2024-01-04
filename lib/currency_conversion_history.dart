import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/NavBar.dart';
import 'package:untitled3/coinCard.dart';
import 'package:untitled3/coinModel.dart';
import 'package:untitled3/dollar_to_inr.dart';
import 'package:untitled3/loginScreen.dart';
import 'package:untitled3/models/user_models.dart';
import 'package:untitled3/service.dart';

class CurrencyCoversionHistory extends StatefulWidget {
  @override
  State<CurrencyCoversionHistory> createState() =>
      _CurrencyCoversionHistoryState();
}

class _CurrencyCoversionHistoryState extends State<CurrencyCoversionHistory> {


  List<Coin> coinList = [];
  initialization()async{
  coinList = await Services().fetchCoin();
  setState(() {

  });
  }

  @override
  void initState() {
initialization();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => loginScreen())));
                },
                icon: Icon(Icons.exit_to_app))
          ],
          title: Text('Currency Coversion History'),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                'Currency Coversion History Page',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: coinList.length,
                itemBuilder: (context, index) {
                  return CoinCard(
                    name: coinList[index].name,
                    symbol: coinList[index].symbol,
                    imageUrl: coinList[index].imageUrl,
                    price: coinList[index].price.toDouble(),
                    change: coinList[index].change.toDouble(),
                    changePercentage:
                        coinList[index].changePercentage.toDouble(),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
