import 'package:crews_net_app/Screens/Dashboard/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class Project extends StatelessWidget {
  const Project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: DashDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            floating: true,
            pinned: false,
            snap: false,
            title: Container(
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
                cursorColor: Colors.blue[100],
                keyboardType: TextInputType.text,
                keyboardAppearance: Brightness.light,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  // enabled: false,
                  suffixIcon: Icon(
                    FontAwesomeIcons.search,
                    size: 3.5.h,
                    color: Color.fromRGBO(188, 111, 241, 0.75),
                  ),
                  contentPadding: EdgeInsets.all(1.2.h),
                  hintText: "Search..",
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(188, 111, 241, 1), fontSize: 2.4.h),
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
                  height: 1.2.h,
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Text(
                    "Ongoing Projects",
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
              (BuildContext context, int item) {
                return Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.all(1.h),
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.4.h),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://static4.depositphotos.com/1015060/482/i/950/depositphotos_4824453-stock-photo-green-park.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            width: double.infinity,
                            height: 8.7.h,
                          ),
                          Container(
                            height: 27.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 22, horizontal: 3.8.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CrewsNet",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    "Crews Net is a project which is intended to bring the developers from different parts of the world together so that they can communicate and contribute on projects together .",
                                    style: TextStyle(fontSize: 11.sp),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total Team Members: ",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "8",
                                      style: TextStyle(
                                          fontSize: 13.sp, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Completed: ",
                                      style: TextStyle(fontSize: 13.74.sp),
                                    ),
                                    Text(
                                      "50%",
                                      style: TextStyle(fontSize: 13.74.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 37.0,
                      left: 28.0,
                      child: CircleAvatar(
                        radius: 28.0,
                        backgroundImage:NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNjY4cTHMrTUvN38LeYxuzmBqeBlEmWB6O_w&usqp=CAU",
                      ),
                        backgroundColor: Colors.blue[500],


                      ),
                    ),
                  ],
                );
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
