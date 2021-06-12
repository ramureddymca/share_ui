/*

import 'dart:convert';

import 'package:share/Model/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/model/Post.dart';

class createPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return createPoststate();
  }
}

Future<Post> createPosts(
    String category, String postInfo, BuildContext context) async {
  var Url = "http://localhost:8080/api/posts";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "firstName": category,
        "lastName": postInfo,
      }));

  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Backend Response', content: response.body);
      },
    );
  }
  return responseString;
}

class createPoststate extends State<createPost> {
  final minimumPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  Post post;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: firstController,
                   */
/* validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter required info';
                      }
                    },*//*

                    decoration: InputDecoration(
                        labelText: 'Category ',
                        hintText: 'Enter Your Category',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumPadding, bottom: minimumPadding),
                  child: TextFormField(
                    style: textStyle,
                    controller: lastController,
                    */
/*validator: (String value) {
                      if (value.isEmpty) {
                        return 'please enter Category';
                      }
                    },*//*

                    decoration: InputDecoration(
                        labelText: 'Post Info',
                        hintText: 'Enter Your post info',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              RaisedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    String category = firstController.text;
                    String postInfo = lastController.text;
                    Post posts = await createPosts(category, postInfo, context);
                    firstController.text = '';
                    lastController.text = '';
                    setState(() {
                      post = posts;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.title,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }
}*/
