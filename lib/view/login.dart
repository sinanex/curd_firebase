import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: "email",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: "password",
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                _login();
              },
              child: Text("login"))
        ],
      ),
    );
  }

  void _login() async {
    try {
      _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException  catch (e) {
      log(e.code);
    }
  }
}
