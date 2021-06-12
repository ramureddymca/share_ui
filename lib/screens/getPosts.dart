import 'dart:convert';
import 'dart:math';

import 'package:share/screens/detailpage.dart';
import 'package:share/Screens/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class getPosts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return getAllPostsState();
  }
}

class getAllPostsState extends State<getPosts> {

  Future<List> getPosts() async {
    final response = await http.get('http://10.0.2.2:8080/api/posts');
    return json.decode(response.body);

  }

  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("All Posts Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => post()));
          },
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getPosts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Icon(Icons.error)));
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(  children: [
                    new Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context) => new Detail(
                                list: snapshot.data,
                                index: index,
                              )),
                        ),
                        child: Container(
                          //color: Colors.black,
                          height: 200.3,
                          child: new Card(
                            color: Colors
                                .primaries[Random().nextInt(Colors.primaries.length)],
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // add this
                              crossAxisAlignment: CrossAxisAlignment.center,
                    /*children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: 200.3,
                            child: Card(
                              color: Colors.blueGrey,//primaries[Random().nextInt(Colors.primaries.length)],
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,*/
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            snapshot.data[index]['category'].toString()+':',
                                            style: TextStyle(
                                                fontSize: 20.0, color: Colors.black87),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            snapshot.data[index]['postInfo'].toString(),
                                            style: TextStyle(
                                                fontSize: 20.0, color: Colors.black87),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            snapshot.data[index]['location'].toString(),
                                            style: TextStyle(
                                                fontSize: 20.0, color: Colors.black87),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            snapshot.data[index]['offeredBy'].toString(),
                                            style: TextStyle(
                                                fontSize: 20.0, color: Colors.black87),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],

                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                  /*return ListTile(
                    title: Text('ID' + ' ' + 'Category' + ' ' + 'Information'),
                    subtitle: Text('${snapshot.data[index].id}' +
                        '${snapshot.data[index].category}' +
                        '${snapshot.data[index].postInfo}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },
                  );*/
                });
          },
        ),
      ),
    );
  }
}

