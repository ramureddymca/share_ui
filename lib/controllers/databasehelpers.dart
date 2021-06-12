import 'dart:convert';
import 'package:http/http.dart' as http;

class DataBaseHelper {
  //Funcion para agregar un producto a la BD
  Future<http.Response> addPost(String categoryController,
      String infoController, String locationController, String offeredByController) async {
    var url = 'http://10.0.2.2:8080/api/posts';

    Map data = {
      'category': '$categoryController',
      'postInfo': '$infoController',
      'location': '$locationController',
      'offeredBy': '$offeredByController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //function for update or put
  Future<http.Response> editPost(String id, String categoryController,
      String infoController, String locationController, String offeredByController) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://10.0.2.2:8080/api/Posts/';

    Map data = {
      'id': '$a',
      'category': '$categoryController',
      'postInfo': '$infoController',
      'location': '$locationController',
      'offeredBy': '$offeredByController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
  // void editarPost(
  //     String _id, String name, String price, String stock) async {

  //   String myUrl = "http://10.0.2.2:8080/api/Posts/$_id";
  //   http.put(myUrl, body: {
  //     "name": "$name",
  //     "price": "$price",
  //     "stock": "$stock"
  //   }).then((response) {
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

  //Funcion para agregar un producto a la BD
  /*Future<http.Response> removeRegister(String id) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://10.0.2.2:8080/api/Posts/delete/$a';

    var response =
    await http.delete(url, headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }*/
}