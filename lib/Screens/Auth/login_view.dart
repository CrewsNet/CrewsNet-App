import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Color.fromRGBO(255, 255, 255, 0.2),
              image: DecorationImage(
                image: AssetImage("assets/background-img.png"),
                colorFilter: new ColorFilter.mode(
                    Color.fromRGBO(33, 33, 33, 0.4), BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    "CrewsNet",
                    style: TextStyle(
                      fontSize: 36.0,
                      color: Colors.white,
                      // fontFamily: 'Verdana',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 15,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      // fontFamily: 'SFProDisplay',
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 32,
                  ),
                  child: Text(
                    "Get connected with the world of projects",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      // fontFamily: 'SFProDisplay'
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Button(
                        title: "Sign In with Google",
                        imageUrl: "assets/Google-icon.png",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Button(
                        title: "Sign In with Google",
                        imageUrl: "assets/GitHub-Icon.png",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            child: const Divider(
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Text("or Log in with Email"),
                          ),
                          Container(
                            width: 120,
                            child: const Divider(
                              color: Color.fromRGBO(196, 196, 196, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 350,
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
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 350,
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
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Enter your password",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Material(
                            child: Checkbox(
                              value: checked,
                              onChanged: (value) {
                                setState(() {
                                  if (checked == true) {
                                    checked = false;
                                  } else {
                                    checked = true;
                                  }
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
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
                      onPressed: () {},
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Not Registers Yet?",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          GestureDetector(
                            onTap: (){},
                            child: Text(
                              "Create an Account",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
                      child: Text(
                        "©2021 CrewsNet All rights reserved.",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  final String imageUrl;

  const Button({Key? key, @required this.title = "", this.imageUrl = ""})
      : super(key: key);
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
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                this.imageUrl,
                width: 50,
                height: 50,
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
      ),
    );
  }
}
