import 'dart:convert';
import 'package:apiproject/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200) {
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else {
      return userList;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API'),centerTitle: true,),
      body: Column(
        children: [
          FutureBuilder(
            future: getUserApi(),
            builder: (context , snap){
              return Expanded(
                child: ListView.builder(
                  itemCount: userList.length,
                 itemBuilder: (context , index){
                  return Container(
                    height: 200,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userList[index].id.toString()),
                        const SizedBox(width: 20,),
                        Text("Name: ${userList[index].name.toString()}"),
                        Text("User Name: ${userList[index].username.toString()}"),
                        Text("Email: ${userList[index].email.toString()}"),
                        Text("Phone: ${userList[index].phone.toString()}"),
                        Text("Website: ${userList[index].website.toString()}"),
                        Text("Zip Code: ${userList[index].address!.zipcode.toString()}"),
                        Text("Lat : ${userList[index].address!.geo!.lat.toString()}"),
                        Text("Lng: ${userList[index].address!.geo!.lng.toString()}"),
                      ],
                    ),
                  );
                 },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
