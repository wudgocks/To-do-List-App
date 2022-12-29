import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolist/firebasecontroller.dart';
import 'package:todolist/home.dart';
import 'package:todolist/logineduser.dart';
import 'package:todolist/model/todoproject.dart';
import 'package:todolist/model/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot> (
        stream: FirebaseController.userSnapshots,
        builder: (context, AsyncSnapshot snapshot) => SafeArea(
          child: Row(
            children: <Widget>[
              TextButton(
                onPressed: () {
                  FirebaseController.addUser(User(name: '김윤섭', email: 'test123@naver.com', password: '1234'));

                },
                child: const Text('Regist'),
              ),
              TextButton(
                onPressed: () async {
                  await FirebaseController.userCollection.doc('6mBEJtk9XrDJ1xF5ETcr').snapshots().listen(
                    (event) => LoginedUser.loginedUser = User.fromJson(event.data()),
                    onError: (error) => print("$error"),
                  );
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}