import "package:flutter/material.dart";

class SubjectListTile extends StatelessWidget{
  final IconData icon;
  final String text;

  const SubjectListTile({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical:5.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color:Colors.blue, size: 30,),
          SizedBox(width:15.0),
          Text("$text", style:TextStyle(fontSize: 20.0))
        ],
      ),
    );
  }
}