import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Login"),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/signup');
            },
            child: Text("SignUp"),
          ),
        ],
      ),
    );
  }
}
