// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace, prefer_is_empty

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import 'package:gylac_dashboard/Utils/widget.dart';


class DriversScreen extends StatefulWidget {
  const DriversScreen({Key? key}) : super(key: key);

  @override
  State<DriversScreen> createState() => _DriversScreenState();
}

class _DriversScreenState extends State<DriversScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  CollectionReference postStream =
      FirebaseFirestore.instance.collection('drivers');
CollectionReference rejectedstream =
      FirebaseFirestore.instance.collection('drivers');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTabController(
              length: 3,
              child: TabBar(
                // indicatorSize: TabBarIndicatorSize.tab,

                indicatorWeight: 5,

                indicatorColor: bluecolor,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                // automaticIndicatorColorAdjustment: true,
                labelColor: bluecolor,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "All Drivers",
                  ),
                  Tab(
                    text: "Accepted",
                  ),
                  Tab(
                    text: "Rejected",
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  // height: 900,
                  // width: 1000,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: postStream.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      // return post();
                      if (snapshot.hasError) {
                        return Center(child: Text('Something went wrong'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return snapshot.data!.docs.length == 0
                          ? Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                // color: Colors.amber,
                                padding: EdgeInsets.symmetric(vertical: 100),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No Active Properties",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Color(0xffE87B31)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            "It appears you have not any properties yet.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xffA0A0A0)),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .03,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ListView(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                return allDrivers(
                                    document['dp'],
                                    document['email'],
                                    document['fullName'],
                                    document['mobileNumber'],
                                    document['vehicleCompany'],
                                    document['status'],
                                    document['id']
                                        );
                              }).toList(),
                            );
                    },
                  ),
                ),
                

                 Container(
                  height: 900,
                  width: 1000,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: postStream.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      // return post();
                      if (snapshot.hasError) {
                        return Center(child: Text('Something went wrong'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return snapshot.data!.docs.length == 0
                          ? Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                // color: Colors.amber,
                                padding: EdgeInsets.symmetric(vertical: 100),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No Active Properties",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Color(0xffE87B31)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            "It appears you have not any properties yet.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xffA0A0A0)),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .03,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ListView(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                return document['status']=='approved'?allDrivers(
                                    document['dp'],
                                    document['email'],
                                    document['fullName'],
                                    document['mobileNumber'],
                                    document['vehicleCompany'],
                                    document['status'],
                                    document['id']
                                        ):Container();
                              }).toList(),
                            );
                    },
                  ),
                ),
             
             






              Container(
                  // height: 900,
                  // width: 1000,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: rejectedstream.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      // return post();
                      if (snapshot.hasError) {
                        return Center(child: Text('Something went wrong'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return snapshot.data!.docs.length == 0
                          ? Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                // color: Colors.amber,
                                padding: EdgeInsets.symmetric(vertical: 100),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No Active Request",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Color(0xffE87B31)),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Wrap(
                                        children: [
                                          Text(
                                            "It appears you have not any request yet.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xffA0A0A0)),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .03,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ListView(
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                return document['status']=='rejected'?allDrivers(
                                    document['dp'],
                                    document['email'],
                                    document['fullName'],
                                    document['mobileNumber'],
                                    document['vehicleCompany'],
                                    document['status'],
                                    document['id']
                                        ):Container();
                              }).toList(),
                            );
                    },
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget mytext(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: MediaQuery.of(context).size.width * .013),
    );
  }

  shwoDialog(String id) async {
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        // title: new Text('Message'),
        content: Container(
          height: MediaQuery.of(context).size.height * .15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  FirebaseFirestore.instance.collection('drivers').doc(id).update({'status': 'approved'});
                },
                child: Row(
                  children: [
                    Image.asset('asset/DashboardIcons/check-circle 1.png'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .01,
                    ),
                    Text(
                      "Approved",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  FirebaseFirestore.instance.collection('drivers').doc(id).update({'status': 'rejected'});
                },
                child: Row(
                  children: [
                    Image.asset('asset/DashboardIcons/x-circle 1.png'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .01,
                    ),
                    Text(
                      "Rejected",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget allDrivers(String profileImage, String email, String userName,
      String mobile, String companyName, status,String docId) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .04,
                height: MediaQuery.of(context).size.height * .08,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(profileImage),
              ),
              Container(
                  //  color: Colors.blue,
                  width: MediaQuery.of(context).size.width * .17,
                  child: mytext(email)),
              Container(
                  //  color: Colors.red,
                  width: MediaQuery.of(context).size.width * .12,
                  child: mytext(userName)),
              Container(
                  //  color: Colors.amber,
                  width: MediaQuery.of(context).size.width * .12,
                  child: mytext(mobile)),
              Container(
                  //  color: Colors.pink,
                  width: MediaQuery.of(context).size.width * .15,
                  child: mytext(companyName)),
              myButton(context, Text('Vehicle Detail'), () {}, .1, .05),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .1,
                  decoration: BoxDecoration(
                      color: Color(0xffE3F8E5),
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    status,
                    style: TextStyle(color: Color(0xff56C662)),
                  ))),
              GestureDetector(
                  onTap: () {
                    shwoDialog(docId);
                  },
                  child: Icon(Icons.more_horiz_outlined))
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}

// DropdownButton<String>(
//                                           elevation: 0,
//                                           isExpanded: true,
//                                           autofocus: true,
//                                           focusColor: Color(0xffE3F8E5),
//                                           dropdownColor: Color(0xffE3F8E5),
//                                           style: TextStyle(
//                                             color: Color(0xff56C662),                                       
//                                           ),
//                                           borderRadius: BorderRadius.circular(30),
//                                           underline: SizedBox(),
//                                           hint: Text('Approved'),
//                                           items: <String>[
//                                             'Approved',
//                                             'Rejected'                                          
//                                           ].map((String value) {
//                                             return DropdownMenuItem<String>(
//                                               value: value,
//                                               child: Text(
//                                                 value,
//                                                 style: TextStyle(
//                                                     color: Colors.black),
//                                               ),
//                                             );
//                                           }).toList(),
//                                           onChanged: (value) {
//                                             print(value);
//                                             // propertyType = value!;
//                                             // print(propertyType);
//                                             // showSnack(context,'$propertyType selected!');
//                                           },
//                                         ),