// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class OrderDetails extends StatefulWidget {
  const OrderDetails({ Key? key }) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final List<ChartData> chartData = [
            ChartData(x:'Steve',y: 38,color: Color(0xff624FD1)),
            ChartData(x:'Jack',y: 34,color: Color(0xff72C1E2)),
            ChartData(x:'Others',y: 52,color: Color(0xffFFA41D))
        ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      // width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height *1,
      child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:10,bottom: 10,top: 40),
            child: Row(
              children: [
                Text('Order ID #',style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width*.025,fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 3)
              ]),
              // child: Stepper(
              //   type: StepperType.horizontal,
              //   steps: [
              //   Step(title:Text('data'), content: Container(
              //     child:Image.asset(mini_truck),
              //   )),
              //   Step(title:Text('data'), content: Container()),
              //   Step(title:Text('data'), content: Container()),
              //   Step(title:Text('data'), content: Container()),
              //   Step(title:Text('data'), content: Container()),
              // ])
              // ImageStepper(
      
              //   images: [
              //     AssetImage(mini_truck),
              //     AssetImage(truck),
              //     AssetImage(sortIcon)
              //   ],
              //   activeStep: activeStep,
              //   onStepReached: (index) {
              //     setState(() {
              //       activeStep = index;
              //     });
              //   },
              // ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
               Padding(
                 padding: const EdgeInsets.all(10),
                 child: Expanded(
                   child: Container(
                     width: MediaQuery.of(context).size.width*.65,
                     height: MediaQuery.of(context).size.height*.4,
                      decoration: BoxDecoration(
                     color: Colors.amber,
                               borderRadius: BorderRadius.circular(10),
                   boxShadow: [
                               BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 2),
                      spreadRadius: 1,
                      blurRadius: 3)
                             ]),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                     width: MediaQuery.of(context).size.width*.61,
                     height: MediaQuery.of(context).size.height*.32,
                      decoration: BoxDecoration(
                     color: Colors.white,
                                 borderRadius: BorderRadius.circular(10),
                   boxShadow: [
                                 BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 2),
                      spreadRadius: 1,
                      blurRadius: 3)
                             ]),
                   ),
                               ),
                             ],),
                   ),
                 ),
               ),
               Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                 width: MediaQuery.of(context).size.width*.385,
                 height: MediaQuery.of(context).size.height*.15,
                      decoration: BoxDecoration(
                 color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
               boxShadow: [
              BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 3)
            ]),
               ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                   width: MediaQuery.of(context).size.width*.25,
                   height: MediaQuery.of(context).size.height*.15,
                      decoration: BoxDecoration(
                   color: Colors.green,
              borderRadius: BorderRadius.circular(10),
               boxShadow: [
              BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 3)
            ]),
               ),
                ),
               ],),
               Row(children: [
                  Padding(
                 padding: const EdgeInsets.all(10),
                 child: Container(
                   width: MediaQuery.of(context).size.width*.65,
                   height: MediaQuery.of(context).size.height*.4,
                    decoration: BoxDecoration(
                   color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
                 boxShadow: [
              BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 3)
            ]),
                 ),
               ),
               ],),
               SizedBox(height: MediaQuery.of(context).size.height *.1,)
              ],),
              Column(children: [
                  Padding(
                 padding: const EdgeInsets.all(10),
                 child: Container(
                   width: MediaQuery.of(context).size.width*.2,
                   height: MediaQuery.of(context).size.height*.6,
                    decoration: BoxDecoration(
                   color: Colors.red,
              borderRadius: BorderRadius.circular(10),
                 boxShadow: [
              BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 3)
            ]),
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.all(10),
                 child: Container(
                   width: MediaQuery.of(context).size.width*.2,
                   height: MediaQuery.of(context).size.height*.5,
                    decoration: BoxDecoration(
                   color: Colors.purple,
              borderRadius: BorderRadius.circular(10),
                 boxShadow: [
              BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 2),
                    spreadRadius: 1,
                    blurRadius: 3)
            ]),
            child: Column(children: [
               SfCircularChart(
                        series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Mode of grouping
                                groupMode: CircularChartGroupMode.point,
                                groupTo: 2
                            )
                        ]
                    )
                
            ],),
                 ),
               ),
              ],)
            ],
          ),
         
        ],
      ),
      ),
      )
    );
  }

}
 class ChartData {
        ChartData({required this.x,required this.y,required this.color});
            final String x;
            final double y;
            final Color color;
    }
// showOrderDetails(BuildContext context, String orderid) {
//   showModalBottomSheet(
//       // enableDrag: true,
    
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           // topLeft: Radius.circular(30),
//           // topRight: Radius.circular(30),
//         ),
//       ),
//       backgroundColor: Colors.red,
//       context: context,
//       builder: (context) {
//         return Column(
//           children: [
//             Container(
//             width: MediaQuery.of(context).size.width * .8,
//             height: MediaQuery.of(context).size.height *.9,
//             child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   children: [
//                     Text('Order ID #$orderid'),
//                   ],
//                 ),
//                 Container(
//                   // width: MediaQuery.of(context).size.width * .25,
//                   height: MediaQuery.of(context).size.height * .2,
//                   decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey,
//                         offset: Offset(2, 2),
//                         spreadRadius: 1,
//                         blurRadius: 3)
//                   ]),
//                   child: Stepper(
//                     type: StepperType.horizontal,
//                     steps: [
//                     Step(title:Text('data'), content: Container(
//                       child:Image.asset(mini_truck),
//                     )),
//                     Step(title:Text('data'), content: Container()),
//                     Step(title:Text('data'), content: Container()),
//                     Step(title:Text('data'), content: Container()),
//                     Step(title:Text('data'), content: Container()),
//                   ])
//                   // ImageStepper(
            
//                   //   images: [
//                   //     AssetImage(mini_truck),
//                   //     AssetImage(truck),
//                   //     AssetImage(sortIcon)
//                   //   ],
//                   //   activeStep: activeStep,
//                   //   onStepReached: (index) {
//                   //     setState(() {
//                   //       activeStep = index;
//                   //     });
//                   //   },
//                   // ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(children: [
//                      Container(
//                        width: MediaQuery.of(context).size.width*.4,
//                        height: MediaQuery.of(context).size.height*.4,
//                        color: Colors.blue,
//                      ),
//                      Row(children: [
//                         Container(
//                        width: MediaQuery.of(context).size.width*.4,
//                        height: MediaQuery.of(context).size.height*.4,
//                        color: Colors.blue,
//                      ),
//                       Container(
//                        width: MediaQuery.of(context).size.width*.4,
//                        height: MediaQuery.of(context).size.height*.4,
//                        color: Colors.blue,
//                      ),
//                      ],)
//                     ],),
//                     Column(children: [
//                         Container(
//                        width: MediaQuery.of(context).size.width*.2,
//                        height: MediaQuery.of(context).size.height*.4,
//                        color: Colors.blue,
//                      )
//                     ],)
//                   ],
//                 ),
               
//               ],
//             ),
//             ),
//       ),
//           ],
//         );
//       });
// }