import 'dart:convert';
import 'package:apiproject/api/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterFrom extends StatefulWidget {
  final Map? userData;
  const RegisterFrom({Key? key,this.userData}) : super(key: key);

  @override
  State<RegisterFrom> createState() => _RegisterFromState();
}

class _RegisterFromState extends State<RegisterFrom> {

  TextEditingController userIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController alterPhoneController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  bool isEdit = false;

  @override
  void initState(){
    super.initState();
    final userData = widget.userData;
    if(userData != null){
      isEdit = true;
      final userid = userData['user_id'];
      final name = userData['name'];
      final phone = userData['phone_no'];
      final alterNative = userData['alternate_phoneno'];
      final zipcode =userData['zipcode'];
      final address_line_1 = userData['address_line_1'];
      final address_line_2 = userData['address_line_2'];
      final city = userData['city'];
      final state = userData['state'];

      userIdController.text = userid;
      nameController.text = name;
      phoneController.text= phone;
      alterPhoneController.text= alterNative;
      zipcodeController.text= zipcode;
      address1Controller.text= address_line_1;
      address2Controller.text= address_line_2;
      cityController.text= city;
      stateController.text= state;

    }
  }

  // Update Api
  Future<void> updateApi() async {

    // final userData = widget.userData;
    // if(userData == null){
    //   print( 'Not ');
    //   return;
    // }

  final userid = userIdController.text;
  final name = nameController.text;
  final phone = phoneController.text;
  final alterNative = alterPhoneController.text;
  final zipcode = zipcodeController.text;
  final address_line_1 = address1Controller.text;
  final address_line_2 = address2Controller.text;
  final city = cityController.text;
  final state = stateController.text;

  final uri = Uri.parse('http://testapi.sojo.com.my/api/address/update_address.php');
  final response = await http.post(uri,
    body: jsonEncode({
      "id":"112",
      "user_id": userid,
      "name": name,
      "phone_no": phone,
      "alternate_phoneno": alterNative,
      "zipcode": zipcode,
      "address_line_1": address_line_1,
      "address_line_2": address_line_2,
      "city": city,
      "state": state,
    }),headers: {'Content-Type': 'application/json'},);

  if(response.statusCode == 200) {
    print('Update successfully');
  }else{
    print('Update error');
  }
}

  Future<void> createApi() async {

    final userid = userIdController.text;
    final name = nameController.text;
    final phone = phoneController.text;
    final alterNative = alterPhoneController.text;
    final zipcode = zipcodeController.text;
    final address_line_1 = address1Controller.text;
    final address_line_2 = address2Controller.text;
    final city = cityController.text;
    final state = stateController.text;

    final uri = Uri.parse('http://testapi.sojo.com.my/api/address/create_address.php');
    final response = await http.post(uri,
      body: jsonEncode({
      "user_id": userid,
      "name": name,
      "phone_no": phone,
      "alternate_phoneno": alterNative,
      "zipcode": zipcode,
      "address_line_1": address_line_1,
      "address_line_2": address_line_2,
      "city": city,
      "state": state,
    }),headers: {'Content-Type': 'application/json'},);

    if(response.statusCode == 200) {
      userIdController.text = '';
      nameController.text = '';
      phoneController.text= '';
      alterPhoneController.text= '';
      zipcodeController.text= '';
      address1Controller.text= '';
      address2Controller.text= '';
      cityController.text= '';
      stateController.text= '';

      print('successfully');
    }else{
      print('error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
             Text(isEdit ? 'Edit From ': 'Register From',style: const TextStyle(fontSize: 30),),
            const SizedBox(height: 10,),
            CustomTextField(hintText: 'User Id', controller: userIdController),
            const SizedBox(height: 10,),
            CustomTextField(hintText: 'Name', controller: nameController),
            const SizedBox(height: 10,),
            CustomTextField(hintText: 'phone', controller: phoneController),
            const SizedBox(height: 10,),
            CustomTextField(hintText: 'Alternative_Phone', controller: alterPhoneController),
            const SizedBox(height: 10,),
            CustomTextField(hintText: 'zipcode', controller: zipcodeController),
            const SizedBox(height: 10,),
            CustomTextField(hintText: 'address_line_1', controller: address1Controller),
            const SizedBox(height: 10,),
            CustomTextField(hintText: 'address_line_2', controller: address2Controller),
            const SizedBox(height: 10,),
            CustomTextField(hintText: 'city', controller: cityController),
            const SizedBox(height: 10,),
            CustomTextField(hintText: 'state', controller: stateController),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: isEdit ? updateApi :createApi, child: Text(isEdit ? 'Update Data':'Save Data'))
          ],
        ),
      ),
    );
  }
}
