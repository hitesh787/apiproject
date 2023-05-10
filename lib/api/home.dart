import 'dart:convert';
import 'package:apiproject/api/register_from/sign_up_from.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ShowDataHomeScreen extends StatefulWidget {
  const ShowDataHomeScreen({Key? key}) : super(key: key);

  @override
  State<ShowDataHomeScreen> createState() => _ShowDataHomeScreenState();
}

class _ShowDataHomeScreenState extends State<ShowDataHomeScreen> {

  List userList = [];
  bool isLoading = true;
  String userid = '13';

  @override
  void initState() {
    super.initState();
    getUserApi();
  }

  // Fetch Data for Api
  Future<void> getUserApi() async {
    final uri = Uri.parse('http://testapi.sojo.com.my/api/address/get_by_user.php');
    final response = await http.post(uri,body: jsonEncode({"user_id": userid,}));

    if(response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['data'] as List;
      setState(() {userList = result;});
    }else {
    }
  }

  // Delete Data for Api
  Future<void> deleteById(String id,index) async {
    final uri = Uri.parse('http://testapi.sojo.com.my/api/address/delete_address.php');
    final response = await http.post(uri,headers:{"content-type": "application/json",},
    body: jsonEncode({
      "user_id": userid,
      "id": id,
    }));
    if(response.statusCode == 200){
     userList.removeAt(index);
      setState(() {});
    }else {}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API'),centerTitle: true,),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index){
          // final user = userList[index] as Map;
          final id = userList[index]['address_id'].toString();
          return Container(
            height: 300,
            margin: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User Id : ${userList[index]['user_id'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("Address Id : ${userList[index]['address_id'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("Name : ${userList[index]['name'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("Phone No : ${userList[index]['phone_no'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("Alternate Phone No. : ${userList[index]['alternate_phoneno'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("Zipcode : ${userList[index]['zipcode'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("Address 1 : ${userList[index]['address_line_1'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("Address 2 : ${userList[index]['address_line_2'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("City : ${userList[index]['city'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("State : ${userList[index]['state'].toString()}",style: const TextStyle(fontSize: 20),),
                    Text("Created Data : ${userList[index]['created_at'].toString()}",style: const TextStyle(fontSize: 20),),
                  ],
                ),
               Row(
                 children: [
                   ElevatedButton(
                       style:ElevatedButton.styleFrom(backgroundColor: Colors.red),
                       onPressed: (){
                         deleteById(id,index);
                        }, child: const Text('Delete')),
                   const SizedBox(width: 5,),
                   ElevatedButton(
                       style:ElevatedButton.styleFrom(backgroundColor: Colors.green),
                       onPressed: (){
                         navigatorEditPages(userList[index]);
                         }, child: const Text('Edit'),
                   ),
                 ],
               ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        navigatorAddPages();
      },child: const Icon(Icons.add),),
    );
  }
  Future<void> navigatorEditPages(Map user) async{
    final route = MaterialPageRoute(builder: (context) =>  RegisterFrom(userData: user));
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    getUserApi();
  }

  Future<void> navigatorAddPages() async{
    final route = MaterialPageRoute(builder: (context) =>  const RegisterFrom());
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    getUserApi();
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
