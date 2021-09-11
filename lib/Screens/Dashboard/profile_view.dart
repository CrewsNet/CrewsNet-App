import 'package:crews_net_app/Screens/Dashboard/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  List<String> Skills = [
    "App Development",
    "Web Development",
  ];
  List<String> Achievements = [
    "Runner Up in Toycathon",
    "Qualified in oogle Kickstart",
    "Codechef 5 stars",
    "Red Coder on Codeforces",
  ];
  List<String> Projects = [
    "CrewsNet (Ongoing)",
    "RefreshUs Done)",
    "EigenFest (Ongoing)",
    "Hub Collab (Done)",
  ];
  List<String> Status = [
    "Ongoing",
    "Done",
    "Ongoing",
    "Done",
  ];
  List<String> Attachments = [
    "Resume.pdf",
    "Presentation.pdf",
  ];
  List<String> Images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNjY4cTHMrTUvN38LeYxuzmBqeBlEmWB6O_w&usqp=CAU",
    "https://images.theconversation.com/files/243439/original/file-20181101-83635-1xcrr39.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=900.0&fit=crop",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzYgxbRzT3_MZRSPAeJ9UQUTqXJdpWZ0sq8A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2glv2VNOFidcNvn2Cu1ptDSDVWlZrx_qTDQ&usqp=CAU",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: DashDrawer(
        selected: 2,
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
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
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(1.8.h, 0, 1.8.h, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: CircleAvatar(
                                child: Image.asset(
                                  "assets/images/avatar.png",
                                  height: 18.h,
                                  width: 18.h,
                                ),
                                radius: 10.7.h,
                              ),
                            ),
                            Text(
                              "Sanskar Modi",
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 17.h,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {},
                                icon: ImageIcon(
                                  AssetImage(
                                    "assets/images/edit.png",
                                  ),
                                  color: Colors.purple,
                                  size: 23.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 12.h,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/images/linkedin.png",
                                      height: 21.sp,
                                      width: 21.sp,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/images/facebook.png",
                                      height: 21.sp,
                                      width: 21.sp,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.instagram,
                                      size: 21.sp,
                                      color: Colors.purple,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/images/GitHub-Icon.png",
                                      height: 21.sp,
                                      width: 21.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 34.h,
                    width: 89.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "App Developer",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              Icon(Icons.mail),
                              SizedBox(
                                width: 3.w,
                              ),
                              Container(
                                width: 75.w,
                                child: Text(
                                  "modisanskar5@gmail.com",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.university),
                              SizedBox(
                                width: 3.w,
                              ),
                              Container(
                                width: 75.w,
                                child: Text(
                                  "Indian Institute of Information Technology, Sonepat",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_pin),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Lucknow,Uttar Pradesh",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 13.sp, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.white,
                           height: 1.sp,

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "42",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Text("Following")
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "445",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Text("Followers")
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "21",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Text("Posts")
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "10",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Text("Projects")
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 0, 3.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 1.5.h, 0, 0),
                          child: new Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sit amet ex scelerisque, ultricies tortor eu, sollicitudin dolor. Morbi porttitor ut diam at tempus. Integer pellentesque pretium eros  ",
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 0, 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Skills",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: Skills.length,
                            itemBuilder: (BuildContext context, int item) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 1.5.h, 0, 0),
                                child: Row(children: [
                                  CircleAvatar(
                                    radius: 6.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp,
                                    ),
                                    child: Text(
                                      Skills[item],
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ]),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 0, 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Achievements",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: Achievements.length,
                            itemBuilder: (BuildContext context, int item) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 1.5.h, 0, 0),
                                child: Row(children: [
                                  CircleAvatar(
                                    radius: 6.0,
                                    backgroundColor: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp,
                                    ),
                                    child: Text(
                                      Achievements[item],
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ]),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 0, 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Projects",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: Projects.length,
                            itemBuilder: (BuildContext context, int item) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 1.5.h, 0, 0),
                                child: InkWell(
                                  onTap: () {},
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25.0,
                                      backgroundImage:
                                          NetworkImage(Images[item]),
                                    ),
                                    title: Text(
                                      "${Projects[item]} (${Status[item]})",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "Started on 12-Sep-2021",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 3.h, 0, 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Attachments",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: Attachments.length,
                            itemBuilder: (BuildContext context, int item) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 1.5.h, 0, 0),
                                child: InkWell(
                                  onTap: () {},
                                  hoverColor: Colors.yellowAccent,
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.blueAccent),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.insert_drive_file_outlined,
                                      size: 4.h,
                                      color: Colors.purple,
                                    ),
                                    title: Text(
                                      Attachments[item],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
