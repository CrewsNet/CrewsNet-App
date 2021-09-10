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
  Future<List> getContests() async {
    try {
      var response = await Dio()
          .get('https://crewsnet-backend.herokuapp.com/user/contest');
      contests = response.data["data"];
    } catch (e) {
      print(e);
    }
    return contests;
  }

  @override
  void initState() {
    getContests();
    super.initState();
  }

  getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy';
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    return DateFormat(dateFormat).format(docDateTime);
  }

  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      drawer: DashDrawer(selected: 3,),
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
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: getContests(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Stack(
                    children: [
                      Padding(
                        padding:EdgeInsets.fromLTRB(0,20.h,0,0),
                        child: Center(
                          child: Container(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    return _ContestData(context, snapshot.data.toList());
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _ContestData(BuildContext context, List contests) {
    return SingleChildScrollView(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: contests.length,
            itemBuilder: (context, int item) {
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
                      bottom: selected.contains(item) ? 20.h : 21.5.h,
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
                              ? Colors.purple
                              : Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 25.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.8.w),
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
            }),
      ),
    );
  }
}
