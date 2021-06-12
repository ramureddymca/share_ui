import 'package:flutter/material.dart';
import 'package:share/screens/createPost.dart';
import 'package:share/screens/getPosts.dart';

import 'addPost.dart';

class post extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return postState();
  }

}

class postState extends State<post>{
  @override
  Widget build(BuildContext context) {
    final minimumPadding = 5.0;
    return Scaffold(
        appBar: AppBar(
        title: Text('Share app'),
        ),
      body: Center(child: Text('Welcome To Share app')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text('Share app'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Create Post'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddPost()));
              },
            ),
            ListTile(
              title: Text('Get Posts'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => getPosts()));
              },
            )
          ],
        ),
      ),
    );
  }

}