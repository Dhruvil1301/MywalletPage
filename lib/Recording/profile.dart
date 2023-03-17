import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import 'package:testing/Recording/mywallet.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/myprofile.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(height: 16.0),
                ),
                Text(
                  'Dhruvil Agrahari',
                  style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold)
                ),
                SizedBox(height: 8.0),
                Text(
                  'Flutter Developer',
                  style: GoogleFonts.lato(fontSize: 16),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.email),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>WalletPage()));
                    },
                    child: Card(
                        child:  ListTile(
                            title: Text('My Wallet',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18),),
                            subtitle:  Icon(Icons.credit_card),
                          ),
                      ),
                  ),
                  ),
               Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: (){
                    },
                    child: Card(

                       child: ListTile(
                          title: Text('Help',style:GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold)),
                         subtitle: Icon(Icons.help_outline),
                        ),
                      ),
                  ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
