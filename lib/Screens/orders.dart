// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Screens/order_details.dart';
import 'package:gylac_dashboard/Utils/widget.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  CollectionReference ordersStream =
      FirebaseFirestore.instance.collection('orders');
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Padding(
            padding: const EdgeInsets.only(left: 15,top: 30),
            child: Row(
              children: [
                Text(
                  'Order Page List',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .035,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                inputFieldCircular(
                    context, 'Search here', null, null, Icon(Icons.search)),
                Spacer(
                  flex: 10,
                ),
                iconContainerWithdoubleIcon(
                    context,
                    Image.asset('asset/DashboardIcons/filter.png'),
                    'Filter',
                    Colors.white,
                    Colors.black,
                    .08,
                    .06,
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.deepOrange,
                    )),
                Spacer(
                  flex: 1,
                ),
                Image.asset(
                  'asset/DashboardIcons/refreshs.png',
                  width: MediaQuery.of(context).size.width * .03,
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          headingRow('Order ID', 'Date', 'Customer Name', 'Location', 'Amount',
              'Status Order'),
          Expanded(
            // padding: EdgeInsets.all(20),
            child: StreamBuilder<QuerySnapshot>(
              stream: ordersStream
                  .orderBy('orderDate', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return snapshot.data!.docs.isEmpty
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        // color: Colors.amber,
                        padding: EdgeInsets.symmetric(vertical: 100),
                        child: Center(
                          child: Text("Noting to show!"),
                        ))
                    : ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          i++;
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OrderDetails(
                                        document['trackStatus'],
                                        document['deliveryPhone'],
                                        document['deliveryAddress'],
                                        document['deliveryName'],
                                        document['pickupName'],
                                        document['duration'],
                                        document['tracking'],
                                        document['pickupLong'],
                                        document['pickupLat'],
                                        document['pickupParcelDesc'],
                                        document['orderId'],
                                        document['pickupParcelName'],
                                        document['pickupDeliveryPrice'],
                                      )));
                              // showOrderDetails(
                              //   context,
                              //   document['orderId'],
                              // );
                            },
                            child: ordersRow(
                              i,
                              document['orderId'],
                              document['orderDate'],
                              document['userName'],
                              document['pickupAddress'],
                              document['pickupDeliveryPrice'],
                              document['orderId'],
                              document['orderStatus'],
                            ),
                          );
                        }).toList(),
                      );
              },
            ),
            //  Column(
            //   children: [
            //     ordersRow(
            //       'id',
            //       'date',
            //       'name',
            //       'location',
            //       'amount',
            //       'docid',
            //       'pending',
            //     )
            //   ],
            // ),
          ),
        ],
      ),
    );
  }

  int activeStep = 1;

  // shwoOrderDetails(
  //   String orderid,
  // ) async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) => new AlertDialog(
  //         content: Container(
  //       width: MediaQuery.of(context).size.width * .8,
  //       height: MediaQuery.of(context).size.height * .8,
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Row(
  //               children: [
  //                 Text('Order ID #$orderid'),
  //               ],
  //             ),
  //             Container(
  //               // width: MediaQuery.of(context).size.width * .25,
  //               height: MediaQuery.of(context).size.height * .2,
  //               decoration: BoxDecoration(color: Colors.white, boxShadow: [
  //                 BoxShadow(
  //                     color: Colors.grey,
  //                     offset: Offset(2, 2),
  //                     spreadRadius: 1,
  //                     blurRadius: 3)
  //               ]),
  //               child: Stepper(
  //                 type: StepperType.horizontal,
  //                 steps: [
  //                 Step(title:Text('data'), content: Container(
  //                   child:Image.asset(mini_truck),
  //                 )),
  //                 Step(title:Text('data'), content: Container()),
  //                 Step(title:Text('data'), content: Container()),
  //                 Step(title:Text('data'), content: Container()),
  //                 Step(title:Text('data'), content: Container()),
  //               ])
  //               // ImageStepper(

  //               //   images: [
  //               //     AssetImage(mini_truck),
  //               //     AssetImage(truck),
  //               //     AssetImage(sortIcon)
  //               //   ],
  //               //   activeStep: activeStep,
  //               //   onStepReached: (index) {
  //               //     setState(() {
  //               //       activeStep = index;
  //               //     });
  //               //   },
  //               // ),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Column(children: [
  //                  Container(
  //                    width: MediaQuery.of(context).size.width*.4,
  //                    height: MediaQuery.of(context).size.height*.4,
  //                    color: Colors.blue,
  //                  ),
  //                  Row(children: [
  //                     Container(
  //                    width: MediaQuery.of(context).size.width*.4,
  //                    height: MediaQuery.of(context).size.height*.4,
  //                    color: Colors.blue,
  //                  ),
  //                   Container(
  //                    width: MediaQuery.of(context).size.width*.4,
  //                    height: MediaQuery.of(context).size.height*.4,
  //                    color: Colors.blue,
  //                  ),
  //                  ],)
  //                 ],),
  //                 Column(children: [
  //                     Container(
  //                    width: MediaQuery.of(context).size.width*.2,
  //                    height: MediaQuery.of(context).size.height*.4,
  //                    color: Colors.blue,
  //                  )
  //                 ],)
  //               ],
  //             ),

  //           ],
  //         ),
  //       ),
  //     )),
  //   );
  // }

  bool showDetailscard = true;

  showDetails(String name) {
    return Visibility(
        visible: showDetailscard,
        child: Container(
          child: Text(name),
        ));
  }

  Widget ordersRow(number, String orderId, String date, String customerName,
      String location, String amount, String docId, String pending) {
    return Container(
      // height: MediaQuery.of(context).size.height *.13,
      color: Colors.transparent,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mytext(context, '$number'),
              Container(
                  // color: Colors.blue,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .08,
                  child: mytext(context, orderId)),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width * .15,
                  child: mytext(context, date)),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * .12,
                  child: mytext(context, customerName)),
              Container(
                  // color: Colors.pink,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .15,
                  child: mytext(context, location)),
              Container(
                  // color: Colors.yellow,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .1,
                  child: mytext(context, amount)),
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
                    pending,
                    style: TextStyle(color: Color(0xff56C662)),
                  ))),
              Container(
                width: MediaQuery.of(context).size.width * .02,
                // color: Colors.amber,
                child: pending == 'pending'
                    ? GestureDetector(
                        onTap: () {
                          shwoDialog(context, docId, () {
                            FirebaseFirestore.instance
                                .collection('orders')
                                .doc(docId)
                                .update({'orderStatus': 'approved'});
                          }, () {
                            FirebaseFirestore.instance
                                .collection('orders')
                                .doc(docId)
                                .update({'orderStatus': 'rejected'});
                          });
                        },
                        child: Icon(Icons.more_horiz_outlined))
                    : Container(),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  Widget headingRow(String orderId, String date, String customerName,
      String location, String amount, String pending) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mytext(context, ''),
              // myheading(context, '$number'),
              // Image.asset(sortIcon),
              Container(
                  // color: Colors.blue,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .08,
                  child: myheading(context, orderId)),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width * .15,
                  child: myheading(context, date)),
              Container(
                  alignment: Alignment.bottomLeft,
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * .12,
                  child: myheading(context, customerName)),
              Container(
                  // color: Colors.pink,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .15,
                  child: myheading(context, location)),
              Container(
                  // color: Colors.yellow,
                  alignment: Alignment.bottomLeft,
                  width: MediaQuery.of(context).size.width * .1,
                  child: myheading(context, amount)),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .1,
                  child: Center(
                      child: myheading(
                    context,
                    pending,
                    // style: TextStyle(color: Colors.black),
                  ))),
              Container(
                width: MediaQuery.of(context).size.width * .02,
                // color: Colors.amber,
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
