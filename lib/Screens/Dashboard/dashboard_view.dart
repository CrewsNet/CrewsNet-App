import 'package:crews_net_app/Screens/Auth/login_view.dart';
import 'package:crews_net_app/Screens/preloader.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatelessWidget {
  static String id = 'landing';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: finalEmail == null
                ? Center(
                    child: Container(
                    child: Text(
                      "Dashboard",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ))
                : Center(
                    child: Container(
                      child: Text(
                        "Welcome ${finalEmail.toString()} to the dashboard again",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ),
          ),
          ElevatedButton(onPressed:  ()async{
            final SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.remove('email');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => LoginPage()));
          }, child: Text("Remove Credentials"))
        ],
      ),

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
    );
  }
}
