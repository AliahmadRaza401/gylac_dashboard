// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Utils/color.dart';

import '../Utils/image.dart';
import '../Utils/widget.dart';

// Widget sideBar(BuildContext context) {
//     return
//   }
int index = 0;

class MobileDashBoard extends StatefulWidget {
  const MobileDashBoard({Key? key}) : super(key: key);

  @override
  State<MobileDashBoard> createState() => _MobileDashBoardState();
}

class _MobileDashBoardState extends State<MobileDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(
                        // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .03),
                  ),
                  iconContainerFormobile(
                      context,
                      Text(
                        "Refresh",
                        style: TextStyle(
                            color: purpleColor,
                            fontSize: MediaQuery.of(context).size.width / 50),
                      ),
                      lightPurpulcolor,
                      .12,
                      22),
                ],
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context)
            //           .size
            //           .height *
            //       .01,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome to Gyalc Admin',
                    style: TextStyle(
                        color: Color(0xff7E7E7E),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .02),
                  ),
                  iconContainerFormobile(
                      context,
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width / 30,
                      ),
                      bluecolor,
                      .05,
                      22),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardStatCardForMobile(
                    bgcolor: skyblue,
                    title: 'Total Revenue',
                    value: '\$ 87,561',
                    image: 'asset/DashboardIcons/revenue.png'),
                DashboardStatCardForMobile(
                    bgcolor: greencolor,
                    title: 'Delivered Ordes',
                    value: '459',
                    image: 'asset/DashboardIcons/deliverd.png'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardStatCardForMobile(
                    bgcolor: deeporangecolor,
                    title: 'Pending Orders',
                    value: '247',
                    image: 'asset/DashboardIcons/pendin.png'),
                DashboardStatCardForMobile(
                    bgcolor: themeColor,
                    title: 'Customers',
                    value: '872',
                    image: 'asset/DashboardIcons/customers.png'),
              ],
            ),

            DashboardDetailsCardForMobile(
                bgcolor: white,
                title: 'Orders Details',
                text1: 'Active Orders',
                value1: '1148',
                text2: 'Pending Orders',
                value2: '200',
                text3: 'Delivered Orders',
                value3: '865',
                text4: 'Cancelled Orders',
                value4: '67',
                progess1: 20,
                totalprogress1: 100,
                progess2: 50,
                totalprogress2: 100,
                progess3: 10,
                totalprogress3: 100,
                progess4: 50,
                totalprogress4: 100),
            DashboardDetailsCardForMobile(
                bgcolor: white,
                title: 'Customers Details',
                text1: 'Total Customers',
                value1: '865',
                text2: 'Active Customers',
                value2: '67',
                text3: 'Delivered Customers',
                value3: '865',
                text4: 'New Customers',
                value4: '67',
                progess1: 20,
                totalprogress1: 100,
                progess2: 50,
                totalprogress2: 100,
                progess3: 10,
                totalprogress3: 100,
                progess4: 50,
                totalprogress4: 100),
            PayrollCardForMobile(
              bgcolor: white,
              title: 'PayRoll',
              filter: 'Filter by da',
              text1: 'Total Payroll',
              value1: '1999900 MNT',
              progess1: 60,
              totalprogress1: 100,
              totalDrivers: '98',
            ),
            DashboardDetailsCardForMobile(
                bgcolor: white,
                title: 'Drivers Details',
                text1: 'Total Drivers',
                value1: '865',
                text2: 'Active Drivers',
                value2: '67',
                text3: 'Pending Drivers',
                value3: '865',
                text4: 'Deactive Drivers',
                value4: '67',
                progess1: 20,
                totalprogress1: 100,
                progess2: 50,
                totalprogress2: 100,
                progess3: 10,
                totalprogress3: 100,
                progess4: 50,
                totalprogress4: 100),
            Expanded(
              child: Container(
                // width: double.infinity,
                height: MediaQuery.of(context).size.height * .1,
                decoration: BoxDecoration(
                    color: themeColor, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    // Spacer(
                    //   flex: 1,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 15),
                      child: inputField(context, "", null, null, null),
                    ),
                    // Spacer(),
                    iconContainerFormobile(
                        context,
                        Text(
                          'Filter by Date',
                          style: TextStyle(color: themeColor, fontSize: 9),
                        ),
                        white,
                        .15,
                        20),
                    // Spacer(flex: 9),
                    Expanded(
                      // width: MediaQuery.of(context).size.width * .3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          iconContainerFormobile(
                              context,
                              Text(
                                'Copy',
                                style: TextStyle(
                                    color: themeColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            .02),
                              ),
                              white,
                              .06,
                              20),
                          iconContainerFormobile(
                              context,
                              Text(
                                'CSV',
                                style: TextStyle(
                                    color: themeColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            .02),
                              ),
                              white,
                              .06,
                              20),
                          iconContainerFormobile(
                              context,
                              Text(
                                'Excel',
                                style: TextStyle(
                                    color: themeColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            .02),
                              ),
                              white,
                              .06,
                              20),
                          iconContainerFormobile(
                              context,
                              Text(
                                'PDF',
                                style: TextStyle(
                                    color: themeColor,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            .02),
                              ),
                              white,
                              .06,
                              20),
                        ],
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DashboardStatCardForMobile extends StatelessWidget {
  Color bgcolor;
  String title;
  String value;
  String image;
  DashboardStatCardForMobile(
      {required this.bgcolor,
      required this.title,
      required this.value,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .17,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: bgcolor,
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width / 50),
            boxShadow: [
              BoxShadow(color: Color(0xffFF507A), offset: Offset(0, 3))
            ]),
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .2,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .02),
                ),
              ],
            ),

            Expanded(child: Image.asset(image))
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: MediaQuery.of(context).size.height * .1,
            //       width: MediaQuery.of(context).size.width * .05,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           image: DecorationImage(
            //               image: AssetImage(image), fit: BoxFit.cover)
            //               ),
            //     )
            //     //   CircleAvatar(
            //     //   backgroundColor: Colors.transparent,
            //     //   radius: MediaQuery.of(context).size.width *.026,
            //     //   backgroundImage:AssetImage(image),
            //     //   // child: Image.asset(image),
            //     // )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class MobileHeader extends StatefulWidget {
  const MobileHeader({Key? key}) : super(key: key);

  @override
  State<MobileHeader> createState() => _MobileHeaderState();
}

class _MobileHeaderState extends State<MobileHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: themeColor,
      height: MediaQuery.of(context).size.height / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Spacer(
          //   flex: 1,
          // ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              flex: 2,
              child: mobileinputField(
                  context, 'Search here', null, null, Icon(Icons.search))),
          // const Spacer(
          //   flex: 4,
          // ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            // width: MediaQuery.of(context).size.width * .2,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mobileiconContainerFormobile(
                    context,
                    Image.asset('asset/DashboardIcons/notification.png'),
                    Colors.white,
                    .05,
                    .03),
                mobileiconContainerFormobile(
                    context,
                    Image.asset('asset/DashboardIcons/chat.png'),
                    Colors.white,
                    .05,
                    .03),
                mobileiconContainerFormobile(
                    context,
                    Image.asset('asset/DashboardIcons/promos.png'),
                    Colors.white,
                    .05,
                    .03),
              ],
            ),
          ),
          // VerticalDivider(
          //   color: drawerIconColor,
          //   indent: 10,
          //   endIndent: 10,
          // ),
          // Spacer(
          //   flex: 1,
          // ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            // width: MediaQuery.of(context).size.width * .3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Henry Jr.",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * .035,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Admin",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .025,
                      ),
                    )
                  ],
                ),
                // iconContainerFormobile(context, null, Colors.white, .03, .06),
                // Container(
                //   padding: EdgeInsets.all(10),
                //   height: MediaQuery.of(context).size.height * .06,
                //   width: MediaQuery.of(context).size.width * .03,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       border: Border.all(color: Colors.grey.withOpacity(.3)),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: DropdownButton<String>(
                //       elevation: 0,
                //       isExpanded: true,
                //       underline: SizedBox(),
                //       hint: Text('EN'),
                //       items: <String>['English', 'Urdu'].map((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(
                //             value,
                //             style: TextStyle(color: Colors.black),
                //           ),
                //         );
                //       }).toList(),
                //       onChanged: (value) {}
                //       //   purpose = value;
                //       //   showSnack(context,'$purpose selected!');
                //       //   // print(purpose);
                //       // },
                //       ),
                // ),
              ],
            ),
          ),
          // Spacer(
          //   flex: 1,
          // )
        ],
      ),
    ));
  }
}

class MobileSideBar extends StatefulWidget {
  const MobileSideBar({Key? key}) : super(key: key);

  @override
  State<MobileSideBar> createState() => _MobileSideBarState();
}

class _MobileSideBarState extends State<MobileSideBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color:Colors.amber,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(logo), fit: BoxFit.cover)),
              // width: double.infinity,
              height: MediaQuery.of(context).size.height / 7,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              color: themeColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('asset/DashboardIcons/ic_dashboard.png',
                        height: MediaQuery.of(context).size.height / 40),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: purpleDashboard,
                          fontSize: MediaQuery.of(context).size.width / 50),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  iconDashboardforMobile('asset/DashboardIcons/profile.png', 0),
                  iconDashboardforMobile('asset/DashboardIcons/Group.png', 1),
                  iconDashboardforMobile(
                      'asset/DashboardIcons/profileGroup.png', 2),
                  iconDashboardforMobile(
                      'asset/DashboardIcons/notifications.png', 3),
                  iconDashboardforMobile('asset/DashboardIcons/doc.png', 4),
                  iconDashboardforMobile(
                      'asset/DashboardIcons/document.png', 5),
                  iconDashboardforMobile(
                      'asset/DashboardIcons/pinloction.png', 6),
                  iconDashboardforMobile('asset/DashboardIcons/setting.png', 7),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget iconDashboardforMobile(String img, int selectedIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = selectedIndex;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Image.asset(
          img,
          height: MediaQuery.of(context).size.height / 50,
        ),
      ),
    );
  }
}

Widget mobileinputField(
    BuildContext context, String placeholder, controller, keyboard, icon) {
  return Container(
    width: MediaQuery.of(context).size.width * .2,
    height: MediaQuery.of(context).size.height * .03,
    decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.3),
              offset: Offset(0, 3),
              spreadRadius: 2,
              blurRadius: 5)
        ]),
    child: TextField(
      keyboardType: keyboard,
      controller: controller,
      style: TextStyle(fontSize: MediaQuery.of(context).size.width / 50),
      decoration: InputDecoration(
        // suffixIcon: icon,
        // hintText: placeholder,

        border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        // isDense: true,
        // contentPadding: EdgeInsets.only(top: 5,left: 4)
      ),
    ),
  );
}

Widget mobileiconContainerFormobile(
    BuildContext context, icon, bgcolor, width, height) {
  return Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: bgcolor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.3),
                offset: Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 1)
          ]),
      child: Center(
        child: icon,
      ));
}

class DashboardDetailsCardForMobile extends StatelessWidget {
  Color bgcolor;
  String title;
  String text1;
  String value1;
  String text2;
  String value2;
  String text3;
  String value3;
  String text4;
  String value4;
  double progess1;
  double totalprogress1;
  double progess2;
  double totalprogress2;
  double progess3;
  double totalprogress3;
  double progess4;
  double totalprogress4;

  DashboardDetailsCardForMobile(
      {required this.bgcolor,
      required this.title,
      required this.text1,
      required this.value1,
      required this.text2,
      required this.value2,
      required this.text3,
      required this.value3,
      required this.text4,
      required this.value4,
      required this.progess1,
      required this.totalprogress1,
      required this.progess2,
      required this.totalprogress2,
      required this.progess3,
      required this.totalprogress3,
      required this.progess4,
      required this.totalprogress4});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * .27,
        width: MediaQuery.of(context).size.width * .42,
        decoration: BoxDecoration(
            color: white,
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width / 50),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffA6442F),
                  offset: Offset(1, 0),
                  spreadRadius: .02,
                  blurRadius: 2)
            ]),
        child: Column(
          children: [
            Row(
              children: [
                iconContainer(
                    context,
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * .015),
                    ),
                    themeColor,
                    .2,
                    .05),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1, 1),
                              spreadRadius: .02,
                              blurRadius: 2)
                        ]),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text1,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value1,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .02),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess1 / totalprogress1,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text2,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value2,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .02),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess2 / totalprogress2,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                      ],
                    )),
                Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1, 1),
                              spreadRadius: .02,
                              blurRadius: 2)
                        ]),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text3,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value3,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .02),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess3 / totalprogress3,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text4,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value4,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .02),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess4 / totalprogress4,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PayrollCardForMobile extends StatelessWidget {
  Color bgcolor;
  String title;
  String text1;
  String value1;
  String filter;
  double progess1;
  double totalprogress1;
  String totalDrivers;

  PayrollCardForMobile(
      {required this.bgcolor,
      required this.title,
      required this.filter,
      required this.text1,
      required this.value1,
      required this.progess1,
      required this.totalprogress1,
      required this.totalDrivers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * .27,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffA6442F),
                  offset: Offset(1, 0),
                  spreadRadius: .02,
                  blurRadius: 2)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconContainer(
                    context,
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * .015),
                    ),
                    themeColor,
                    .2,
                    .05),
                iconContainer(
                    context,
                    Text(
                      filter,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * .015),
                    ),
                    themeColor,
                    .1,
                    .05),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Container(
                    height: MediaQuery.of(context).size.height / 9,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1, 1),
                              spreadRadius: .02,
                              blurRadius: 2)
                        ]),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text1,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .009),
                            ),
                            Text(
                              value1,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .015),
                            ),
                          ],
                        ),
                        LinearProgressIndicator(
                          value: progess1 / totalprogress1,
                          color: bluecolor,
                          backgroundColor: drawerIconColor,
                        ),
                      ],
                    )),
                Spacer(
                  flex: 4,
                ),
                iconContainerFormobile(
                    context,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Divers ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          totalDrivers,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    bgcolor,
                    .3,
                    10),
                Spacer(),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconContainerFormobile(
                    context,
                    Text(
                      'Copy',
                      style: TextStyle(
                          color: white,
                          fontSize: MediaQuery.of(context).size.width / 50),
                    ),
                    themeColor,
                    .1,
                    20),
                iconContainerFormobile(
                    context,
                    Text(
                      'CSV',
                      style: TextStyle(
                          color: white,
                          fontSize: MediaQuery.of(context).size.width / 50),
                    ),
                    themeColor,
                    .1,
                    20),
                iconContainerFormobile(
                    context,
                    Text(
                      'Excel',
                      style: TextStyle(
                          color: white,
                          fontSize: MediaQuery.of(context).size.width / 50),
                    ),
                    themeColor,
                    .1,
                    20),
                iconContainerFormobile(
                    context,
                    Text(
                      'PDF',
                      style: TextStyle(
                          color: white,
                          fontSize: MediaQuery.of(context).size.width / 50),
                    ),
                    themeColor,
                    .1,
                    20),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
