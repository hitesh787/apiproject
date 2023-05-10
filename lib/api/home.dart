import 'dart:convert';
import 'package:apiproject/api/model/From.dart';
import 'package:apiproject/api/register_from/sign_up_from.dart';
import 'package:http/http.dart' as http;
import 'package:apiproject/api/model/user_from.dart';
import 'package:flutter/material.dart';

class ShowDataHomeScreen extends StatefulWidget {
  const ShowDataHomeScreen({Key? key}) : super(key: key);

  @override
  State<ShowDataHomeScreen> createState() => _ShowDataHomeScreenState();
}

class _ShowDataHomeScreenState extends State<ShowDataHomeScreen> {

  List userList = [];

  @override
  void initState() {
    super.initState();
    getUserApi();
  }

  // Fetch Data for Api
  Future<void> getUserApi() async {

    final uri = Uri.parse('http://testapi.sojo.com.my/api/address/get_by_user.php');
    final response = await http.post(uri,body: jsonEncode({"user_id": "16",}));

    if(response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['data'] as List;
      setState(() {userList = result;});
    }else {
    }
  }

  // Delete Data for Api
  Future<void> deleteById(String id) async {

    final uri = Uri.parse('http://testapi.sojo.com.my/api/address/delete_address.php');
    final response = await http.post(uri,headers:{"content-type": "application/json",},
    body: jsonEncode({
      "user_id": "16",
      "id": "111",
    }));

    if(response.statusCode == 200){
      final filter = userList.where((element) => element['id'] != id).toList();
      setState(() {
        userList = filter;
      });
    }else {}
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API'),centerTitle: true,),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index){
          final user = userList[index] as Map;
          final id = user['user_id'] as String;
          return Container(
            height: 250,
            margin: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User Id : ${user['user_id'].toString()}"),
                    Text("Address Id : ${user['address_id'].toString()}"),
                    Text("Name : ${user['name'].toString()}"),
                    Text("Phone No : ${user['phone_no'].toString()}"),
                    Text("Alternate Phone No. : ${user['alternate_phoneno'].toString()}"),
                    Text("Zipcode : ${user['zipcode'].toString()}"),
                    Text("Address 1 : ${user['address_line_1'].toString()}"),
                    Text("Address 2 : ${user['address_line_2'].toString()}"),
                    Text("City : ${user['city'].toString()}"),
                    Text("State : ${user['state'].toString()}"),
                    Text("Created Data : ${user['created_at'].toString()}"),
                  ],
                ),
               Row(
                 children: [
                   ElevatedButton(
                       style:ElevatedButton.styleFrom(backgroundColor: Colors.red),
                       onPressed: (){
                         deleteById(id);
                        }, child: const Text('Delete')),
                   const SizedBox(width: 20,),
                   ElevatedButton(
                       style:ElevatedButton.styleFrom(backgroundColor: Colors.green),
                       onPressed: (){
                         navigatorEditPages(user);
                         print('Edit');}, child: const Text('Edit'),
                   ),
                 ],
               ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterFrom()));
      },child: const Icon(Icons.add),),
    );
  }
  void navigatorEditPages(Map user){
    final route = MaterialPageRoute(builder: (context) =>  RegisterFrom(userData: user));
    Navigator.push(context, route);
  }
}


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ApiDemo extends StatefulWidget {
//   @override
//   _ApiDemoState createState() => _ApiDemoState();
// }
//
// class _ApiDemoState extends State<ApiDemo> {
//   final apiUrl = 'https://jsonplaceholder.typicode.com/todos';
//   final titleController = TextEditingController();
//   final descriptionController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Demo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(
//                 hintText: 'Enter todo title',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: descriptionController,
//               decoration: InputDecoration(
//                 hintText: 'Enter todo description',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 final title = titleController.text;
//                 final description = descriptionController.text;
//
//                 final requestBody = json.encode({
//                   'title': title,
//                   'description': description,
//                   'completed': false,
//                 });
//
//                 try {
//                   final response = await http.post(
//                     Uri.parse(apiUrl),
//                     headers: {'Content-Type': 'application/json'},
//                     body: requestBody,
//                   );
//
//                   if (response.statusCode == 201) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Todo added successfully'),
//                       ),
//                     );
//                   } else {
//                     throw Exception('Failed to add todo');
//                   }
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//               child: Text('Add Todo'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ApiDemo extends StatefulWidget {
//   @override
//   _ApiDemoState createState() => _ApiDemoState();
// }
//
// class _ApiDemoState extends State<ApiDemo> {
//   final apiUrl = 'https://jsonplaceholder.typicode.com/todos';
//   List<dynamic> todoList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   Future<void> getData() async {
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//
//       if (response.statusCode == 200) {
//         final responseBody = json.decode(response.body);
//         setState(() {
//           todoList = responseBody;
//         });
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Demo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: todoList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final todo = todoList[index];
//                   return ListTile(
//                     title: Text(todo['title']),
//                     subtitle: Text(todo['completed'] ? 'Completed' : 'Incomplete'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
