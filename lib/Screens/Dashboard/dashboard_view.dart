// import 'package:crews_net_app/Screens/Auth/login_view.dart';
// import 'package:crews_net_app/Screens/preloader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:crews_net_app/Screens/Dashboard/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatelessWidget {
  static String id = 'landing';

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Container(
            width: 80.w,
            height: 6.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(3.6.h),
              border: Border.all(
                color: Color.fromRGBO(71, 71, 71, 1),
              ),
            ),
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                // enabled: false,
                suffixIcon: Icon(
                  Icons.search,
                  size: 4.h,
                  color: Color.fromRGBO(188, 111, 241, 1),
                ),
                contentPadding: EdgeInsets.all(10.0),
                hintText: "Search..",
                hintStyle: TextStyle(
                    color: Color.fromRGBO(188, 111, 241, 1), fontSize: 2.4.h),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        drawer: DashDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: RichText(
                  text: TextSpan(
                    text: 'Welcome Back,  ',
                    style: TextStyle(fontSize: 25.0),
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Modiji!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Feeds",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color.fromRGBO(188, 111, 241, 1),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Flexible(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, items) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 16.0),
                        tileColor: Color.fromRGBO(71, 71, 71, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.black),
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          child: Text(
                            "S",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          backgroundColor: Colors.pink,
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.more_vert_sharp,
                            size: 30.0,
                          ),
                          onPressed: () {},
                        ),
                        title: Row(
                          children: [
                            Text("Sanskar"),
                            SizedBox(
                              width: 40.0,
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
                ),
              ),
              Container(
                width: 100.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(71, 71, 71, 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My active projects",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Color.fromRGBO(188, 111, 241, 1),
                            ),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Color.fromRGBO(188, 111, 241, 1),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color:Color.fromRGBO(188, 111, 241, 1),
                      thickness: 1.5,
                      indent: 15.0,
                      endIndent: 15.0,
                    ),
                   ListTile(
                     leading: CircleAvatar(
                       radius: 30,
                       backgroundColor: Colors.cyan,
                       child: Text("CN",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),

                     ),
                     title: Text("CrewsNet Project",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                     subtitle:Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: Text("Completed:50%",style: TextStyle(fontSize: 17.0),),
                     ) ,
                   ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
