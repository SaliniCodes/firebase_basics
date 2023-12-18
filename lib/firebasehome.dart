import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainhome.dart';


class Firebasehome extends StatelessWidget {
   Firebasehome({super.key});
  TextEditingController usercontroller = TextEditingController();

  TextEditingController passcontroller= TextEditingController();
   Future<void> registerWithEmailAndPassword(String email, String password,var context) async {
     try {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: email,
         password: password,
       );
       Navigator.push(context, MaterialPageRoute(builder: (context) {
         return mainhome();
       },));

       // Registration successful
     } catch (e) {
       // Handle registration failure
       print('Error: $e');
     }
   }

signOut() async {
  await FirebaseAuth.instance.signOut();

}
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold( backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          children: [
            TextField(controller: usercontroller,
              decoration: InputDecoration(
                labelText: 'Enter your Username', // Placeholder text
                border: OutlineInputBorder(), // Border design
              ),
            ),
            SizedBox(height: 20,),
            TextField(controller: passcontroller,
              decoration: InputDecoration(
                labelText: 'Enter your Password', // Placeholder text
                border: OutlineInputBorder(), // Border design
              ),
            ),
ElevatedButton(onPressed:(){
  registerWithEmailAndPassword(usercontroller.text,passcontroller.text,context  );
}, child: Text('Signup'))
          ],
        ),
      ),),
    );
  }
}
