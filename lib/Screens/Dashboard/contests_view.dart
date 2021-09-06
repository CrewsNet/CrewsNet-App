import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'drawer.dart';

class Contests extends StatefulWidget {
  const Contests({Key? key}) : super(key: key);

  @override
  _ContestsState createState() => _ContestsState();
}

class _ContestsState extends State<Contests> {
  var selected = [];
  var contests = [];
void getContests() async {
  try {
    var response = await Dio().get('https://crewsnet-backend.herokuapp.com/user/contests');
    contests = response.data["data"];
  } catch (e) {
    print(e);
  }
}
  @override
  void initState() {
    getContests();
    super.initState();
  }
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
                  margin: EdgeInsets.all(1.h),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.4.h),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 3.8.w,
                        bottom: selected.contains(item) ? 15.h : 16.5.h,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (selected.contains(item))
                                selected.remove(item);
                              else
                                selected.add(item);
                            });
                          },
                          icon: Icon(
                            selected.contains(item)?FontAwesomeIcons.solidBookmark:FontAwesomeIcons.bookmark,
                            size: 4.8.h,
                            color: selected.contains(item)
                                ? Colors.blue
                                : Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 20.h,
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 3.8.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "26",
                                  style: TextStyle(
                                      fontSize: 29.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "JUNE ",
                                  style: TextStyle(fontSize: 13.7.sp),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  contests[item]["name"],
                                  style: TextStyle(
                                      fontSize: 15.2.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "7AM-8PM",
                                  style: TextStyle(
                                      fontSize: 14.2.sp, color: Colors.white),
                                ),
                              ],
                            ),
                            Text(
                              contests[item]['url'],
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ],
                        ),
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
