import 'package:flutter/material.dart';
import 'package:share/controllers/databasehelpers.dart';
import 'package:share/screens/getPosts.dart';

class AddPost extends StatefulWidget {
  /*AddPost({required Key key, required this.title}) : super(key: key);*/
  //final String title;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  final TextEditingController categoryController = new TextEditingController();
  final TextEditingController postInfoController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController offeredByController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Post',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Add Post'),
        // ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: categoryController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'category',
                    hintText: 'Post category',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: postInfoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'postInfo',
                    hintText: 'Post Information',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: locationController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    hintText: 'Place to meet',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: offeredByController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'offeredBy',
                    hintText: 'Offered By',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: () {
                    //databaseHelper.addPosto();
                    databaseHelper.addPost(
                        categoryController.text.trim(),
                        postInfoController.text.trim(),
                        locationController.text.trim(),
                        offeredByController.text.trim());
                    Navigator.pop(context, true);
                  },
                  color: Colors.blue,
                  child: new Text(
                    'Add',
                    style: new TextStyle(
                        color: Colors.white, backgroundColor: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}