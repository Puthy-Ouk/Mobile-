import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main()=> runApp(facebook());
class facebook extends StatefulWidget {
  
  @override
  _facebookState createState() => _facebookState();
}

class _facebookState extends State<facebook> {
  Map users;
  List userData;

  Future getUser() async{
    http.Response response = await http.get("https://reqres.in/api/users?page=2");
    //debugPrint(response.body);
    users = jsonDecode(response.body);
    setState(() {
     userData = users['data']; 
    });
    debugPrint(userData.toString());
  }
  @override

  void initState() {
    
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Facebook"),
          backgroundColor: Colors.pink,
          leading: Icon(Icons.menu,color: Colors.white,),
          actions: <Widget>[
            Image.network("http://www.pngmart.com/files/10/Black-Apple-Logo-PNG-Clipart.png")
          ],
        ),
        body: ListView.builder(
          itemCount: userData == null? 0 : userData.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network(userData[index]['avatar'],
                  fit: BoxFit.cover,
                  width:400.0 ,
                  height: 400.0,),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(userData[index]['avatar']),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${userData[index]['first_name']} , ${userData[index]['last_name']}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                      ),

                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.thumb_up),
                        color: Colors.lime,
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.thumb_down),
                        color: Colors.lightGreen,
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.share),
                        color: Colors.lightBlue,
                      ),
                    ],
                  ),
                ),
              ],
              
              ),
            );
          },
        ),
      )

    );
  }
}