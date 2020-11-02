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
        child: Image(
          image: AssetImage('assets/images/learning.png'),
        ),
        // child: CircleAvatar(
        //   radius: 182.0,
        //   backgroundColor: Colors.transparent,
        //   backgroundImage: AssetImage('assets/images/learning.jpeg'),
        // ),
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
        'E-Funza provides an integrated e-learning solution to all children and students between the age of 11 and 21. Our platform offers an accelerated learning environment to enable our participants improve on their literacy especially through understanding of the English language, communication skills, and even sharpen their focus through entertaining puzzle games. Our packages give access to such programs as E-READATHON and E-LAB:',
        textAlign: TextAlign.center,
        style:TextStyle(fontSize: 16.0, color:Colors.black),
      ),
    );

    final eReadathon = Padding(
      padding: EdgeInsets.all(8.0),
      child:Text(
        'E-READATHON: a literacy-based competition where participants engage in weekly reading competitions and answering a set of questions based on the content provided. Our weekly winners get awarded.',
        textAlign: TextAlign.center,
        style:TextStyle(fontSize: 16.0, color:Colors.black),
      ),
    );

    final eLab = Padding(
      padding: EdgeInsets.all(8.0),
      child:Text(
        'E-LAB: an interactive science experimentations and projects platform for all science, engineering, and technology enthusiasts. Participants engage in tests to gauge their level of understanding. The best participants get awarded.',
        textAlign: TextAlign.center,
        style:TextStyle(fontSize: 16.0, color:Colors.black),
      ),
    );

    final mission = Padding(
      padding: EdgeInsets.all(8.0),
      child:Column(
        children: [
          Text(
            'MISSION',
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 16.0, color:Colors.black, fontWeight: FontWeight.bold),
          ),
          Text('To foster a sustainable learning eco-system by creating experiences where English language is made easier to understand and apply in practical environments.',
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 16.0, color:Colors.black),),
        ],
      ),
    );

    final vision = Padding(
      padding: EdgeInsets.all(8.0),
      child:Column(
        children: [
          Text(
            'VISION',
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 16.0, color:Colors.black, fontWeight: FontWeight.bold),
          ),
          Text('Establish a society that can communicate effectively.',
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 16.0, color:Colors.black),),
        ],
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
          eReadathon,
          eLab,
          mission,
          vision,
        ],
      )
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: body
      ),
    );
  }
}