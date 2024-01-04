import 'package:flutter/material.dart';
import 'package:untitled3/Profile/Profilepage.dart';
import 'package:untitled3/contactus_page.dart';
import 'package:untitled3/currency_list.dart';
import 'package:untitled3/dollar_to_inr.dart';
import 'package:untitled3/inr_to_dollar.dart';
import 'package:untitled3/rate_alerts_page.dart';

import 'currency_conversion_history.dart';
import 'exchange_rates.dart';
import 'rate_alerts_page.dart';
import 'feedback.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userModel!.username),
            accountEmail: Text(userModel!.useremail),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://wallpapers.com/images/hd/whatsapp-dp-man-in-cap-ucw3kyzqvvuadj33.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/originals/32/32/a6/3232a6149c24de2b824d116b39c7df72.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              }),
          ListTile(
              leading: Icon(Icons.contact_page),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()));
              }),
          // ListTile(
          //     leading: Icon(Icons.currency_exchange),
          //     title: Text('Currency Conversion'),
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => DollarToINR()));
          //     }),
          ListTile(
              leading: Icon(Icons.currency_bitcoin),
              title: Text('Currency List'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Currencylist()));
              }),
          ListTile(
              leading: Icon(Icons.corporate_fare),
              title: Text('Exchange Rate'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExchangeRates()));
              }),
          ListTile(
              leading: Icon(Icons.history),
              title: Text('Currency Conversion History'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CurrencyCoversionHistory()));
              }),

          ListTile(
            leading: Icon(Icons.add_alert),
            title: Text('Rate Alert'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CurrencyCoversionHistory()));
            },
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.newspaper),
          //   title: Text('Currency News'),
          //   onTap: () => null,
          //   trailing: ClipOval(
          //     child: Container(
          //       color: Colors.red,
          //       width: 20,
          //       height: 20,
          //       child: Center(
          //         child: Text(
          //           '5',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 12,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // ListTile(
          //   leading: Icon(Icons.trending_up),
          //   title: Text('Market Trends'),
          //   onTap: () => null,
          // ),
          ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedBack()));
              }),
        ],
      ),
    );
  }
}
