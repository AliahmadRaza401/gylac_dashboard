// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, file_names, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import '../Utils/widget.dart';
import 'home_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int totalCustomers = 0;
  int pendingOrders = 0;
  int deliverdOrders = 0;
  int activedOrders = 0;
  int canceledOrders = 0;
  int totalDrivers=0;
  int activeDrivers=0;
  int pendingDrivers=0;
  int rejectedDrivers=0;
  @override
  void initState() {
    super.initState();
    getCount();
  }

  Future getCount() async {
    FirebaseFirestore.instance
        .collection('orders') //your collectionref
        .where('orderStatus', isEqualTo: 'pending')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        pendingOrders = count;
      });
    });
    FirebaseFirestore.instance
        .collection('orders') //your collectionref
        .where('orderStatus', isEqualTo: 'completed')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        deliverdOrders = count;
      });
    });
    FirebaseFirestore.instance
        .collection('orders') //your collectionref
        .where('orderStatus', isEqualTo: 'canceled')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        canceledOrders = count;
      });
    });
    FirebaseFirestore.instance
        .collection('orders') //your collectionref
        .where('orderStatus', isEqualTo: 'active')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        activedOrders = count;
      });
    });

    FirebaseFirestore.instance
        .collection('drivers') //your collectionref
        // .where('status', isEqualTo: 'active')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        totalDrivers = count;
      });
    });
      FirebaseFirestore.instance
        .collection('drivers') //your collectionref
        .where('status', isEqualTo: 'pending')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        pendingDrivers = count;
      });
    });

      FirebaseFirestore.instance
        .collection('drivers') //your collectionref
        .where('status', isEqualTo: 'rejected')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        rejectedDrivers = count;
      });
    });
  

    FirebaseFirestore.instance
        .collection('drivers') //your collectionref
        .where('status', isEqualTo: 'active')
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        activeDrivers = count;
      });
    });

    

    FirebaseFirestore.instance
        .collection('users') //your collectionref
        // .where('deleted', isEqualTo: false)
        .get()
        .then((value) {
      var count = 0;
      count = value.docs.length;
      setState(() {
        totalCustomers = count;
      });
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              // color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * .02),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
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
                              style: TextStyle(color: purpleColor),
                            ),
                            lightPurpulcolor,
                            .08,
                            .06),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .01,
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
              height: MediaQuery.of(context).size.height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DashboardStatCard(
                    bgcolor: skyblue,
                    title: 'Total Revenue',
                    value: '\$ 87,561',
                    image: 'asset/DashboardIcons/revenue.png'),
                DashboardStatCard(
                    bgcolor: greencolor,
                    title: 'Delivered Ordes',
                    value: '$deliverdOrders',
                    image: 'asset/DashboardIcons/deliverd.png'),
                DashboardStatCard(
                    bgcolor: deeporangecolor,
                    title: 'Pending Orders',
                    value: '$pendingOrders',
                    image: 'asset/DashboardIcons/pendin.png'),
                DashboardStatCard(
                    bgcolor: themeColor,
                    title: 'Customers',
                    value: '$totalCustomers',
                    image: 'asset/DashboardIcons/customers.png'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DashboardDetailsCard(
                    bgcolor: white,
                    title: 'Orders Details',
                    text1: 'Active Orders',
                    value1: '$activedOrders',
                    text2: 'Pending Orders',
                    value2: '$pendingOrders',
                    text3: 'Delivered Orders',
                    value3: '$deliverdOrders',
                    text4: 'Cancelled Orders',
                    value4: '$canceledOrders',
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
                    value1: '$totalCustomers',
                    text2: 'Active Customers',
                    value2: '$activedOrders',
                    text3: 'Delivered Customers',
                    value3: '$deliverdOrders',
                    text4: 'New Customers',
                    value4: '$pendingOrders',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    value1: '$totalDrivers',
                    text2: 'Active Drivers',
                    value2: '$activeDrivers',
                    text3: 'Pending Drivers',
                    value3: '$pendingDrivers',
                    text4: 'Deactive Drivers',
                    value4: '$rejectedDrivers',
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
                    height: MediaQuery.of(context).size.height * .1,
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        inputField(context, "", null, null, null),
                        Spacer(),
                        iconContainer(
                            context,
                            Text(
                              'Filter by Date',
                              style: TextStyle(color: themeColor),
                            ),
                            white,
                            .08,
                            .05),
                        Spacer(flex: 9),
                        Container(
                          width: MediaQuery.of(context).size.width * .3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              iconContainer(
                                  context,
                                  Text(
                                    'Copy',
                                    style: TextStyle(color: themeColor),
                                  ),
                                  white,
                                  .07,
                                  .05),
                              iconContainer(
                                  context,
                                  Text(
                                    'CSV',
                                    style: TextStyle(color: themeColor),
                                  ),
                                  white,
                                  .07,
                                  .05),
                              iconContainer(
                                  context,
                                  Text(
                                    'Excel',
                                    style: TextStyle(color: themeColor),
                                  ),
                                  white,
                                  .07,
                                  .05),
                              iconContainer(
                                  context,
                                  Text(
                                    'PDF',
                                    style: TextStyle(color: themeColor),
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
      ),
    );
  }
}
