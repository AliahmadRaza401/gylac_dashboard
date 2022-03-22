// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, unused_element, dead_code, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Models/drivers_list_model.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import 'package:gylac_dashboard/Utils/image.dart';
import 'package:gylac_dashboard/Utils/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getDrivers();
    super.initState();
  }
  var driversList = <DriversListModel>[];

  Future<void> getDrivers() async {
    print('function chala hai');
    try {
      QuerySnapshot driversSnapshot =
          await FirebaseFirestore.instance.collection("drivers").get();
      // doctorsList.clear();
      for (var items in driversSnapshot.docs) {
        driversList.add(DriversListModel(
            items['fullName'],
            items['email'],
            items['mobileNumber'],
            items['dp'],
            items['id'],
            items['level'],
            items['approved'],
            items['password'],
            items['rating'],
            items['vDp'],
            items['vehicleCompany'],
            items['vehicleChassisNumber'],
            items['vehicleDesign'],
            items['vehicleRegNumber'],
            items['vehicleNumber']
            ));
      }
      print(driversList);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            color: themeColor,
            child: Row(
              children: [
                Expanded(flex: 1, child: sideBar()),
                Expanded(
                    flex: 10,
                    child: Container(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: headerWidget(),
                          ),
                          Expanded(
                              flex: 6,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: ListView(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Dashboard',
                                                  style: TextStyle(
                                                      // color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .02),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .01,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Welcome to Gyalc Admin',
                                                  style: TextStyle(
                                                    color: Color(0xff7E7E7E),
                                                    fontWeight: FontWeight.bold,
                                                    // fontSize:
                                                    //     MediaQuery.of(context).size.width *
                                                    //         .02
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                iconContainer(
                                                    context,
                                                    Text(
                                                      "Refresh",
                                                      style: TextStyle(
                                                          color: purpleColor),
                                                    ),
                                                    lightPurpulcolor,
                                                    .08,
                                                    .06),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .01,
                                                ),
                                                iconContainer(
                                                    context,
                                                    Icon(
                                                      Icons.settings,
                                                      color: Colors.white,
                                                    ),
                                                    bluecolor,
                                                    .03,
                                                    .06),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .03,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DashboardStatCard(
                                            bgcolor: skyblue,
                                            title: 'Total Revenue',
                                            value: '\$ 87,561',
                                            image:
                                                'asset/DashboardIcons/revenue.png'),
                                        DashboardStatCard(
                                            bgcolor: greencolor,
                                            title: 'Delivered Ordes',
                                            value: '459',
                                            image:
                                                'asset/DashboardIcons/deliverd.png'),
                                        DashboardStatCard(
                                            bgcolor: deeporangecolor,
                                            title: 'Pending Orders',
                                            value: '247',
                                            image:
                                                'asset/DashboardIcons/pendin.png'),
                                        DashboardStatCard(
                                            bgcolor: themeColor,
                                            title: 'Customers',
                                            value: '872',
                                            image:
                                                'asset/DashboardIcons/customers.png'),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DashboardDetailsCard(
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
                                        DashboardDetailsCard(
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
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PayrollCard(
                                          bgcolor: white,
                                          title: 'PayRoll',
                                          filter: 'Filter by da',
                                          text1: 'Total Payroll',
                                          value1: '1999900 MNT',
                                          progess1: 60,
                                          totalprogress1: 100,
                                          totalDrivers: '98',
                                        ),
                                        DashboardDetailsCard(
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
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            // width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .1,
                                            decoration: BoxDecoration(
                                                color: themeColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              children: [
                                                Spacer(
                                                  flex: 1,
                                                ),
                                                inputField(
                                                    "", null, null, null),
                                                Spacer(),
                                                iconContainer(
                                                    context,
                                                    Text(
                                                      'Filter by Date',
                                                      style: TextStyle(
                                                          color: themeColor),
                                                    ),
                                                    white,
                                                    .08,
                                                    .05),
                                                Spacer(flex: 9),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .3,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      iconContainer(
                                                          context,
                                                          Text(
                                                            'Copy',
                                                            style: TextStyle(
                                                                color:
                                                                    themeColor),
                                                          ),
                                                          white,
                                                          .07,
                                                          .05),
                                                      iconContainer(
                                                          context,
                                                          Text(
                                                            'CSV',
                                                            style: TextStyle(
                                                                color:
                                                                    themeColor),
                                                          ),
                                                          white,
                                                          .07,
                                                          .05),
                                                      iconContainer(
                                                          context,
                                                          Text(
                                                            'Excel',
                                                            style: TextStyle(
                                                                color:
                                                                    themeColor),
                                                          ),
                                                          white,
                                                          .07,
                                                          .05),
                                                      iconContainer(
                                                          context,
                                                          Text(
                                                            'PDF',
                                                            style: TextStyle(
                                                                color:
                                                                    themeColor),
                                                          ),
                                                          white,
                                                          .07,
                                                          .05),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }

  Widget sideBar() {
    return Container(
      // color:Colors.amber,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(logo), fit: BoxFit.cover)),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .2,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .1,
            color: themeColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('asset/DashboardIcons/ic_dashboard.png',
                      height: MediaQuery.of(context).size.height * .03),
                  Text(
                    'Dashboard',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: purpleDashboard,
                        fontSize: MediaQuery.of(context).size.width * .01),
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
                iconDashboard('asset/DashboardIcons/profile.png'),
                iconDashboard('asset/DashboardIcons/Group.png'),
                iconDashboard('asset/DashboardIcons/profileGroup.png'),
                iconDashboard('asset/DashboardIcons/notifications.png'),
                iconDashboard('asset/DashboardIcons/doc.png'),
                iconDashboard('asset/DashboardIcons/document.png'),
                iconDashboard('asset/DashboardIcons/pinloction.png'),
                iconDashboard('asset/DashboardIcons/setting.png'),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget iconDashboard(String img) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Image.asset(
        img,
        height: MediaQuery.of(context).size.height * .03,
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      color: themeColor,
      height: MediaQuery.of(context).size.height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacer(
            flex: 1,
          ),
          inputField('Search here', null, null, Icon(Icons.search)),
          Spacer(
            flex: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconContainer(
                    context,
                    Image.asset('asset/DashboardIcons/notification.png'),
                    Colors.white,
                    .03,
                    .06),
                iconContainer(
                    context,
                    Image.asset('asset/DashboardIcons/chat.png'),
                    Colors.white,
                    .03,
                    .06),
                iconContainer(
                    context,
                    Image.asset('asset/DashboardIcons/promos.png'),
                    Colors.white,
                    .03,
                    .06),
              ],
            ),
          ),
          VerticalDivider(
            color: drawerIconColor,
            indent: 10,
            endIndent: 10,
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .2,
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
                          fontSize: MediaQuery.of(context).size.width * .014,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Admin")
                  ],
                ),
                iconContainer(context, null, Colors.white, .03, .06),
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * .06,
                  width: MediaQuery.of(context).size.width * .07,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<String>(
                      elevation: 0,
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text('EN'),
                      items: <String>['English', 'Urdu'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {}
                      //   purpose = value;
                      //   showSnack(context,'$purpose selected!');
                      //   // print(purpose);
                      // },
                      ),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }

  Widget inputField(String placeholder, controller, keyboard, icon) {
    return Container(
      width: MediaQuery.of(context).size.width * .3,
      // height: MediaQuery.of(context).size.height *.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
        decoration: InputDecoration(
            suffixIcon: icon,
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
      ),
    );
  }
}

class DashboardStatCard extends StatelessWidget {
  Color bgcolor;
  String title;
  String value;
  String image;
  DashboardStatCard(
      {required this.bgcolor,
      required this.title,
      required this.value,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .17,
      width: MediaQuery.of(context).size.width * .2,
      decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(20),
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
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * .02),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width * .05,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              )
              //   CircleAvatar(
              //   backgroundColor: Colors.transparent,
              //   radius: MediaQuery.of(context).size.width *.026,
              //   backgroundImage:AssetImage(image),
              //   // child: Image.asset(image),
              // )
            ],
          ),
        ],
      ),
    );
  }
}

class DashboardDetailsCard extends StatelessWidget {
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

  DashboardDetailsCard(
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
                    height: MediaQuery.of(context).size.height * .17,
                    width: MediaQuery.of(context).size.width * .2,
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
                    height: MediaQuery.of(context).size.height * .17,
                    width: MediaQuery.of(context).size.width * .2,
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

class PayrollCard extends StatelessWidget {
  Color bgcolor;
  String title;
  String text1;
  String value1;
  String filter;
  double progess1;
  double totalprogress1;
  String totalDrivers;

  PayrollCard(
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
        width: MediaQuery.of(context).size.width * .42,
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
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .2,
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
                  flex: 5,
                ),
                iconContainer(
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
                    .1,
                    .1),
                Spacer(),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconContainer(
                    context,
                    Text(
                      'Copy',
                      style: TextStyle(color: white),
                    ),
                    themeColor,
                    .07,
                    .04),
                iconContainer(
                    context,
                    Text(
                      'CSV',
                      style: TextStyle(color: white),
                    ),
                    themeColor,
                    .07,
                    .04),
                iconContainer(
                    context,
                    Text(
                      'Excel',
                      style: TextStyle(color: white),
                    ),
                    themeColor,
                    .07,
                    .04),
                iconContainer(
                    context,
                    Text(
                      'PDF',
                      style: TextStyle(color: white),
                    ),
                    themeColor,
                    .07,
                    .04),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
