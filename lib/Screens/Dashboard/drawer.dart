import 'package:crews_net_app/Screens/Auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashDrawer extends StatefulWidget {
  const DashDrawer({Key? key}) : super(key: key);

  @override
  _DashDrawerState createState() => _DashDrawerState();
}

class _DashDrawerState extends State<DashDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 35.0,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      "CrewsNet",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: Colors.white,
              ),
            ),
            ListTile(
              hoverColor: Color.fromRGBO(188, 111, 241, 1),
              onTap: () {
                // setState(() {
                //   _selected=!_selected;
                // });
              },
              selectedTileColor: Color.fromRGBO(71, 71, 71, 1),
              focusColor: Color.fromRGBO(71, 71, 71, 1),
              leading: Icon(
                Icons.menu,
                size: 25,
              ),
              title: Text(
                "Feed",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              hoverColor: Colors.red,
              onTap: () {
                // setState(() {
                //   _selected=!_selected;
                // });
              },
              selectedTileColor: Color.fromRGBO(71, 71, 71, 1),
              focusColor: Color.fromRGBO(71, 71, 71, 1),
              leading: Icon(
                FontAwesomeIcons.book,
                size: 25,
              ),
              title: Text(
                "Projects",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              hoverColor: Colors.red,
              onTap: () {},
              selectedTileColor: Color.fromRGBO(71, 71, 71, 1),
              focusColor: Color.fromRGBO(71, 71, 71, 1),
              leading: Icon(
                FontAwesomeIcons.user,
                size: 28,
              ),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              hoverColor: Colors.red,
              onTap: () {},
              selectedTileColor: Color.fromRGBO(71, 71, 71, 1),
              focusColor: Color.fromRGBO(71, 71, 71, 1),
              leading: Icon(
                FontAwesomeIcons.trophy,
                size: 28,
              ),
              title: Text(
                "Contests",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              hoverColor: Colors.red,
              onTap: () {},
              selectedTileColor: Color.fromRGBO(71, 71, 71, 1),
              focusColor: Color.fromRGBO(71, 71, 71, 1),
              leading: Icon(
                FontAwesomeIcons.calendarCheck,
                size: 28,
              ),
              title: Text(
                "Saved Contests",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              trailing: Container(
                child: Center(
                    child: Text(
                  "3",
                  style: TextStyle(fontSize: 20.0),
                )),
                height: 28,
                width: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromRGBO(20, 255, 0, 1),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              hoverColor: Colors.red,
              onTap: () {},
              selectedTileColor: Color.fromRGBO(71, 71, 71, 1),
              focusColor: Color.fromRGBO(71, 71, 71, 1),
              leading: Icon(
                FontAwesomeIcons.facebookMessenger,
                size: 28,
              ),
              title: Text(
                "Messages",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 15.h,),
            ListTile(

              hoverColor: Colors.red,
              onTap:  ()async{
                final SharedPreferences preferences = await SharedPreferences.getInstance();
                preferences.remove('email');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
              },
              selectedTileColor: Color.fromRGBO(71, 71, 71, 1),
              focusColor: Color.fromRGBO(71, 71, 71, 1),
              leading: Icon(
                FontAwesomeIcons.signOutAlt,
                size: 28,
              ),
              title: Text(
                "LogOut",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}