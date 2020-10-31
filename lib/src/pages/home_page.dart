import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() { 
    super.initState();   
  }

  @override
  Widget build(BuildContext context) {
    final profilePic = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/e-funza2.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child:Text(
        'E-Funza',
        style:TextStyle(fontSize: 28.0, color:Colors.black),
      ),
    );

    final bio = Padding(
      padding: EdgeInsets.all(8.0),
      child:Text(
        'Google Flutter developer Kenya',
        textAlign: TextAlign.center,
        style:TextStyle(fontSize: 16.0, color:Colors.black),
      ),
    );

    final fav = Padding(
      padding: EdgeInsets.all(8.0),
      child:Text(
        'For God so loved the world, that he gave his only son, tht whosoever beieveth in him should not perish but have everlasting life',
        textAlign: TextAlign.center,
        style:TextStyle(fontSize: 16.0, color:Colors.black),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[
            Colors.yellow[200],
            Colors.yellow[200],
          ]
        ),
      ),
      child:Column(
        children: <Widget>[
          profilePic,
          welcome,
          bio,
          fav
        ],
      )
    );

    return Scaffold(
      body: body,
    );
  }
}