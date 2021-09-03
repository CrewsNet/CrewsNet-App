// import 'package:crews_net_app/Screens/Auth/login_view.dart';
// import 'package:crews_net_app/Screens/preloader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:crews_net_app/Screens/Dashboard/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class Dashboard extends StatefulWidget {
  static String id = 'landing';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: DashDrawer(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              floating: true,
              pinned: false,
              snap: false,
              title:  Center(
                child: Container(
                  width: 80.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(2.h),
                    border: Border.all(
                      color: Color.fromRGBO(71, 71, 71, 1),
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(

                      // enabled: false,
                      suffixIcon: Icon(
                        FontAwesomeIcons.search,
                        size: 3.5.h,
                        color: Color.fromRGBO(188, 111, 241, 1),
                      ),
                      contentPadding: EdgeInsets.all(1.2.h),
                      hintText: "Search..",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(188, 111, 241, 1),
                          fontSize: 2.4.h),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 2.4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Text(
                      "Feeds",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.2.sp,
                        color: Color.fromRGBO(188, 111, 241, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.6.h,
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 1.8.h, horizontal: 4.w),
                      tileColor: Color.fromRGBO(71, 71, 71, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.6.h),
                        side: BorderSide(color: Colors.black),
                      ),
                      leading: CircleAvatar(
                        radius: 19.sp,
                        child: Text(
                          "S",
                          style: TextStyle(
                            fontSize: 15.2.sp,
                            color: Colors.blue,
                          ),
                        ),
                        backgroundColor: Colors.pink,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.more_vert_sharp,
                          size: 3.6.h,
                        ),
                        onPressed: () {},
                      ),
                      title: Row(
                        children: [
                          Text("Sanskar"),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text("${formattedDate}"),
                        ],
                      ),
                      subtitle: GestureDetector(
                        child: Text("Add a project"),
                      ),
                    ),
                  );
                },
                childCount: 8,
              ),
            ),
          ],
        ),

      ),
    );
  }
}
