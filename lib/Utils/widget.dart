// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Utils/color.dart';
import 'package:gylac_dashboard/Utils/image.dart';

Widget iconContainer(BuildContext context, icon, bgcolor, width, height) {
  return Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height * height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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

Widget myButton(BuildContext context, btnText, VoidCallback function,
    double btnWidth, double btnHeight) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
        width: MediaQuery.of(context).size.width * btnWidth,
        height: MediaQuery.of(context).size.height * btnHeight,
        decoration: BoxDecoration(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: themeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: function,
            child: btnText)),
  );
}

shwoDialog(BuildContext context, String id, VoidCallback approvedFunction,
    VoidCallback rejectFunction) async {
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
              onTap: approvedFunction,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            GestureDetector(
              onTap: rejectFunction,
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

Widget mytext(BuildContext context, String text) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .01),
  );
}

Widget myheading(BuildContext context, String text) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * .012,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10,),
          Image.asset(sortIcon,height: 13,)
        ],
      ),
    ],
  );
}

Widget inputField(
    BuildContext context, String placeholder, controller, keyboard, icon) {
  return Container(
    width: MediaQuery.of(context).size.width * .3,
    height: MediaQuery.of(context).size.height * .06,
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
      style: TextStyle(fontSize: MediaQuery.of(context).size.width / 80),
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
          // isDense: true,
          contentPadding: EdgeInsets.only(left: 15, top: 20)),
    ),
  );
}

Widget iconContainerFormobile(
    BuildContext context, icon, bgcolor, width, height) {
  return Container(
      width: MediaQuery.of(context).size.width * width,
      height: MediaQuery.of(context).size.height / height,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width / 70),
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
