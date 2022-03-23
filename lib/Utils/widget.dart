 // ignore_for_file: prefer_const_constructors

 import 'package:flutter/material.dart';
import 'package:gylac_dashboard/Utils/color.dart';
 
  Widget iconContainer(BuildContext context,icon,bgcolor,width,height) {
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
        child: Center(child: icon,));
  }


  Widget myButton(BuildContext context,btnText, VoidCallback function,double btnWidth, double btnHeight) {
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
              borderRadius: BorderRadius.circular(
               10
              ),
            )),
            onPressed: function,
            child: btnText
            )),
  );
}



  Widget inputField(BuildContext context,String placeholder, controller, keyboard, icon) {
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

