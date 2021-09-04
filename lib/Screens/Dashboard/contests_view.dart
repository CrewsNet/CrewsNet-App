import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'drawer.dart';

class Contests extends StatefulWidget {
  const Contests({Key? key}) : super(key: key);

  @override
  _ContestsState createState() => _ContestsState();
}

class _ContestsState extends State<Contests> {
  var selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: DashDrawer(),
      body: CustomScrollView(
        physics: ScrollPhysics(),
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
                  // enabled: false,
                  border: OutlineInputBorder(borderSide: BorderSide.none),
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
                    "Contests",
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
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 10,
                        bottom: 110,
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              if (selected.contains(item))
                                selected.remove(item);
                              else
                                selected.add(item);
                            });
                            print(selected);
                          },
                          icon: Icon(
                            FontAwesomeIcons.solidBookmark,
                            size: 40,
                            color: selected.contains(item)
                                ? Colors.blue
                                : Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "26",
                                  style: TextStyle(
                                      fontSize: 38.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "JUNE ",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Container(
                                  width: 89.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Codechef",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "7AM-8PM",
                                        style: TextStyle(
                                            fontSize: 20.0, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 89.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "www.codechef.com",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                      Text(
                                        "Active",
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // subtitle: Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       // Row(
                        //       //   mainAxisAlignment:
                        //       //       MainAxisAlignment.spaceBetween,
                        //       //   children: [
                        //       //     Text(
                        //       //       "Codechef",
                        //       //       style: TextStyle(
                        //       //           fontSize: 20.0,
                        //       //           fontWeight: FontWeight.bold,
                        //       //           color: Colors.white),
                        //       //     ),
                        //       //     Text(
                        //       //       "7AM-8PM",
                        //       //       style: TextStyle(
                        //       //           fontSize: 20.0, color: Colors.white),
                        //       //     ),
                        //       //   ],
                        //       // ),
                        //       // Padding(
                        //       //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        //       //   child: Row(
                        //       //     mainAxisAlignment:
                        //       //         MainAxisAlignment.spaceBetween,
                        //       //     children: [
                        //       //       Text(
                        //       //         "www.codechef.com",
                        //       //         style: TextStyle(fontSize: 18.0),
                        //       //       ),
                        //       //       Text(
                        //       //         "Active",
                        //       //         style: TextStyle(fontSize: 18.0),
                        //       //       ),
                        //       //     ],
                        //       //   ),
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ],
                  ),
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

