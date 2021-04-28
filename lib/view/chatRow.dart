import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fluffychat_ios/view/messagesView.dart';

class ChatRow extends ListTile {
  String name, message, date;
  int unReadCount;
  bool isRead;
  Color contrastColor = const Color.fromARGB(255, 0, 145, 255);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MessagesView(name))
        );
      },
      child: Container(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/ac.jpg", width: 60, height: 60,),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //alignment: Alignment.centerLeft,
                    // color: Colors.pink,
                    width: 250,
                    child: Text(name, style: new TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Row(children: [
                    Container(
                      // color: Colors.deepPurple,
                      width: 250,
                      child: Text(message),
                    ),
                    Container(
                      child: Text(date),
                    ),
                  ])
                ],
              ),
              Visibility(
                visible: isRead ? false : true,
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
                    child: Text("$unReadCount",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.white
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: contrastColor,
                      shape: BoxShape.circle,
                    ),
                    width: 20,
                    height: 20
                ),
              )
            ],
          )
      ),
    );
  }

  ChatRow(String name, message, date, int unReadCount, bool isRead) {
    this.name = name;
    this.message = message;
    this.date = date;
    this.unReadCount = unReadCount;
    this.isRead = isRead;
  }
}