// ignore_for_file: prefer_const_constructors, unused_label

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gylac_dashboard/Screens/drivers.dart';
import 'package:gylac_dashboard/Screens/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: FirebaseOptions(
      apiKey: "AIzaSyDzv8BE4FWuz7dTxPR38umPBKaNatMZLz4",
      appId: "1:658702519280:web:99f530f006f06d23206b35",
      messagingSenderId: "658702519280",
      projectId: "gylac-80caf",
    )
  );
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1920, 2276),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (){
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
    });
  }
}
