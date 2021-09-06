import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Contests extends StatefulWidget {
  const Contests({Key? key}) : super(key: key);

  @override
  _ContestsState createState() => _ContestsState();
}

class _ContestsState extends State<Contests> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  var selected = [];
  var contests = [];
  void getContests() async {
    try {
      var response = await Dio()
          .get('https://crewsnet-backend.herokuapp.com/user/contests');
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

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;
  }

  getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy';
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    return DateFormat(dateFormat).format(docDateTime);
  }

  Widget build(BuildContext context) {
    print(contests);
    print(DateTime.now());
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
                var contest = contests[item];
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
                        bottom: selected.contains(item) ? 18.h : 19.5.h,
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
                            selected.contains(item)
                                ? FontAwesomeIcons.solidBookmark
                                : FontAwesomeIcons.bookmark,
                            size: 4.8.h,
                            color: selected.contains(item)
                                ? Colors.blue
                                : Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 23.h,
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
                                getCustomFormattedDateTime(
                                            contest['start_time'], 'dd/yy') ==
                                        getCustomFormattedDateTime(
                                            contest['end_time'], 'dd/yy')
                                    ? Text(
                                        getCustomFormattedDateTime(
                                            contest['start_time'], 'dd/yyyy'),
                                        style: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "${getCustomFormattedDateTime(contest['start_time'], 'dd/yyyy')}-${getCustomFormattedDateTime(contest['end_time'], 'dd/yyyy')}",
                                        style: TextStyle(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                getCustomFormattedDateTime(
                                            contest['start_time'], 'dd/yy') ==
                                        getCustomFormattedDateTime(
                                            contest['end_time'], 'dd/yy')
                                    ? Text(
                                        getCustomFormattedDateTime(
                                            contest['start_time'], 'MMMM'),
                                        style: TextStyle(fontSize: 13.7.sp),
                                      )
                                    : Text(
                                        "${getCustomFormattedDateTime(contest['start_time'], 'MMMM')}-${getCustomFormattedDateTime(contest['end_time'], 'MMMM')}",
                                        style: TextStyle(fontSize: 13.7.sp),
                                      ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contest['name'],
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                getCustomFormattedDateTime(
                                            contest['start_time'], 'dd/yy') ==
                                        getCustomFormattedDateTime(
                                            contest['end_time'], 'dd/yy')
                                    ? Text(
                                        "${getCustomFormattedDateTime(contest['start_time'], 'HH:mm')}-${getCustomFormattedDateTime(contest['end_time'], 'HH:mm')}",
                                        style: TextStyle(fontSize: 13.sp),
                                      )
                                    : Text(""),
                              ],
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.deferToChild,
                              onTap: () {
                                _launchInBrowser(contest['url']);
                              },
                              child: Text(
                                "Click here for more info",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: contests.length,
            ),
          ),
        ],
      ),
    );
  }
}
