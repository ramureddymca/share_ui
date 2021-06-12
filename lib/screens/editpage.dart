import 'package:flutter/material.dart';
import 'package:share/controllers/databasehelpers.dart';
import 'package:share/screens/getPosts.dart';

class EditPost extends StatefulWidget {
  final List list;
  final int index;

  EditPost({required this.list, required this.index});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditPost> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  late TextEditingController controllerCategory;
  late TextEditingController controllerPostInfo;
  late TextEditingController controllerLocation;
  late TextEditingController controllerOfferedBy;
  late TextEditingController controllerId;

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => getPosts()),
    );

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    controllerId = new TextEditingController(
        text: widget.list[widget.index]['id'].toString());
    controllerCategory = new TextEditingController(
        text: widget.list[widget.index]['category'].toString());
    controllerPostInfo = new TextEditingController(
        text: widget.list[widget.index]['postInfo'].toString());
    controllerLocation = new TextEditingController(
        text: widget.list[widget.index]['location'].toString());
    controllerOfferedBy = new TextEditingController(
        text: widget.list[widget.index]['offeredBy'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Edit product"),
      // ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerId,
                    decoration: new InputDecoration(
                      hintText: "Id",
                      labelText: "Id",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerCategory,
                    validator: (value) {
                      if (value!.isEmpty) return "category";
                    },
                    decoration: new InputDecoration(
                      hintText: "Category",
                      labelText: "Category",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerPostInfo,
                    validator: (value) {
                      if (value!.isEmpty) return "postInfo";
                    },
                    decoration: new InputDecoration(
                      hintText: "PostInfo",
                      labelText: "PostInfo",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.black),
                  title: new TextFormField(
                    controller: controllerLocation,
                    validator: (value) {
                      if (value!.isEmpty) return "location";
                    },
                    decoration: new InputDecoration(
                      hintText: "location",
                      labelText: "location",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.settings_input_component,
                      color: Colors.black),
                  title: new TextFormField(
                    controller: controllerOfferedBy,
                    validator: (value) {
                      if (value!.isEmpty) return "offeredBy";
                    },
                    decoration: new InputDecoration(
                      hintText: "offeredBy",
                      labelText: "offeredBy",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    databaseHelper.editPost(
                        controllerId.text.trim(),
                        controllerCategory.text.trim(),
                        controllerPostInfo.text.trim(),
                        controllerLocation.text.trim(),
                        controllerOfferedBy.text.trim());
                    _navigateList(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}