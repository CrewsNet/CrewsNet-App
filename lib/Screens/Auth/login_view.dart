import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../PageNotFound.dart';
import 'signup_view.dart';
// import 'package:mdi/mdi.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  bool checked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background - Image
            Container(
              decoration: BoxDecoration(
                // color: Color.fromRGBO(255, 255, 255, 0.2),
                image: DecorationImage(
                  image: AssetImage("assets/images/background-img.png"),
                  colorFilter: new ColorFilter.mode(
                      Color.fromRGBO(33, 33, 33, 0.4), BlendMode.dstATop),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CrewsNet",
                        style: TextStyle(
                          fontSize: 36.0,
                          color: Colors.white,
                          // fontFamily: 'Verdana',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                          // fontFamily: 'SFProDisplay',
                          fontSize: 32.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Get connected with the world of projects",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          // fontFamily: 'SFProDisplay'
                        ),
                      ),
                      Button(
                        title: "Sign In with Google",
                        imageUrl: "assets/images/google.png",
                      ),
                      Button(
                        title: "Sign In with Github",
                        imageUrl: "assets/images/GitHub-Icon.png",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            child: const Divider(
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                          Text("or Log in with Email"),
                          Container(
                            width: 120,
                            child: const Divider(
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CustomTextField(hintText: "Enter Your Email", controller: emailController),
                          Text(
                            "Password",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                         CustomTextField(controller: passwordController, hintText: "Enter Your Password")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Checkbox(
                            activeColor: Colors.blueGrey,
                            value: checked,
                            onChanged: (value) {
                              setState(() {
                                checked = !checked;
                              });
                            },
                          ),
                          Text(
                            "Remember Me",
                          ),
                          const SizedBox(
                            width: 100.0,
                          ),
                          Text(
                            "Forget Password?",
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(220, 44)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(71, 71, 71, 1)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => PageNotFound(),
                          ));
                        },
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: 300,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Not Registers Yet?",
                                style: TextStyle(color: Colors.white, fontSize: 16.0),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => SignUpPage(),
                                  ));
                                },
                                child: Text(
                                  "Create an Account",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "©2021 CrewsNet All rights reserved.",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText
  });

  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        alignment: Alignment.center,
        width: 400,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            shape: BoxShape.rectangle,
            color: Color.fromRGBO(20, 20, 20, 1)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            12.0,
            8.0,
            8.0,
            8.0,
          ),
          child: TextFormField(
            controller: controller,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(
                //   Radius.circular(20.0),
                // ),
                borderSide: BorderSide(
                  width: 3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  final String imageUrl;

  const Button({Key? key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(220, 44)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(Color.fromRGBO(71, 71, 71, 1)),
      ),
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              this.imageUrl,
              width: 40,
              height: 40,
            ),
            Text(
              this.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
