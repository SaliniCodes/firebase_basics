import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainhome.dart';


class loginhome extends StatelessWidget {
  loginhome({super.key});
  TextEditingController usercontroller = TextEditingController();

  TextEditingController passcontroller= TextEditingController();


  Future<void> loginAccount(String emailAddress,String password,var context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return mainhome();
      },));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
                loginAccount(usercontroller.text,passcontroller.text,context);
              }, child: Text('Login'))
            ],
          ),
        ),),
    );
  }
}
