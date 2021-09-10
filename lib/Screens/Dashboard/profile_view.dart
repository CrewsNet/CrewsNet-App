import 'package:crews_net_app/Screens/Dashboard/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late double _rating;
  bool isExpanded = false;
  void initState() {
    super.initState();
    _rating = 3;
  }

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
    "CrewsNet",
    "RefreshUs",
    "EigenFest",
    "Hub Collab",
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
      drawer: DashDrawer(selected: 2,),
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
                  Stack(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ6HwFbv2pKgCHgjyv8x_yBfGhGjmpbHJxJQ&usqp=CAU"),
                      radius: 11.h,
                    ),
                    Positioned(
                      left: 31.w,
                      top: 16.h,
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                        iconSize: 22.sp,
                      ),
                    ),
                  ]),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(0, 2.h, 0, 0),
                  //   child: Text(
                  //     ' $_rating',
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20.sp,
                  //       color: Colors.green[500],
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
                  //   child: RatingBar.builder(
                  //     initialRating: 3,
                  //     minRating: 1,
                  //     direction: Axis.horizontal,
                  //     allowHalfRating: true,
                  //     glowColor: Colors.amber,
                  //     glow: true,
                  //     glowRadius: 25.sp,
                  //     unratedColor: Colors.green[50],
                  //     itemCount: 5,
                  //     itemSize: 22.sp,
                  //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  //     itemBuilder: (context, _) => Icon(
                  //       Icons.star,
                  //       color: Colors.green[500],
                  //     ),
                  //     onRatingUpdate: (rating) {
                  //       setState(
                  //         () {
                  //           _rating = rating;
                  //         },
                  //       );
                  //     },
                  //     updateOnDrag: true,
                  //   ),
                  // ),
                  Container(
                    height: 25.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Captain America",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "App Developer",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "captainAmerica69@gmail.com",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Indian Institute of Information Technology, Sonepat",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "India,Uttar Pradesh",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                    child: Container(
                      width: 94.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About Me",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          new Column(
                            children: <Widget>[
                              new AnimatedSize(
                                  vsync: this,
                                  duration: const Duration(milliseconds: 500),
                                  child: new ConstrainedBox(
                                      constraints: isExpanded
                                          ? new BoxConstraints()
                                          : new BoxConstraints(maxHeight: 50.0),
                                      child: new Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sit amet ex scelerisque, ultricies tortor eu, sollicitudin dolor. Morbi porttitor ut diam at tempus. Integer pellentesque pretium eros vel hendrerit. Etiam eleifend dolor sed ex commodo imperdiet. Donec quis aliquam sapien, ac molestie neque. Nullam massa odio, maximus at auctor eget, pretium eu nisl. Donec pharetra ipsum fermentum dui condimentum facilisis. Cras ipsum ipsum, eleifend eu cursus non, porttitor ac arcu. Suspendisse potenti. Vestibulum porta porttitor nisl non pellentesque. Nunc ullamcorper orci vel velit condimentum elementum. Vivamus vitae est id odio commodo dapibus sit amet sed neque. Nulla tempus justo.",
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                      ))),
                              isExpanded
                                  ? new GestureDetector(
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Read Less',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.blue[400]),
                                          )),
                                      onTap: () => setState(
                                          () => isExpanded = !isExpanded))
                                  : new GestureDetector(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Read More',
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              color: Colors.blue[400]),
                                        ),
                                      ),
                                      onTap: () => setState(
                                        () => isExpanded = !isExpanded,
                                      ),
                                    )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                    child: Container(
                      width: 94.w,
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
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                    child: Container(
                      width: 94.w,
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
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 3.h, 0, 0),
                    child: Container(
                      width: 94.w,
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
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25.0,
                                      backgroundImage:
                                          NetworkImage(Images[item]),
                                    ),
                                    title: Text(
                                      Projects[item],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "9-9-2021 (six hours ago)",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
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
