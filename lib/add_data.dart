// import 'dart:convert';
// import 'package:apiproject/model/emaimodel.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class AddUserScreen extends StatelessWidget {
//   AddUserScreen({super.key});
//
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descController = TextEditingController();
//
//   Future<void> addUser(User user) async {
//
//     const apiUrl = 'https://api.nstack.in/v1/todos';
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(user.toJson()),
//     );
//     if (response.statusCode == 201) {
//       print('Sussess');
//     } else {
//       print('Error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add User'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: titleController,
//             decoration: const InputDecoration(
//               labelText: 'title',
//             ),
//           ),
//           const SizedBox(height: 15,),
//           TextField(
//             controller: descController,
//             decoration: const  InputDecoration(
//               labelText: 'Desc',
//             ),
//           ),
//           const SizedBox(height: 15,),
//           ElevatedButton(
//             onPressed: () {
//               final user = User(
//                 title: titleController.text,
//                 description: descController.text,
//               );
//               addUser(user);
//             },
//             child: const Text('Add User'),
//           ),
//           const SizedBox(height: 15,),
//
//
//         ],
//       ),
//     );
//   }
// }
