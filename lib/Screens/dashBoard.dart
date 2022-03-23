// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Utils/color.dart';

import '../Utils/widget.dart';
import 'home_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({ Key? key }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                                                inputField(context,
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
                              ),
    );
  }
}