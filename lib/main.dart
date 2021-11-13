import 'package:flutter/material.dart';
import 'package:iron_Lifter/adminReports.dart';
import 'package:iron_Lifter/adminpagerequests.dart';
import 'package:iron_Lifter/consultation.dart';
import 'package:iron_Lifter/homepage.dart';
import 'package:iron_Lifter/login.dart';
import 'package:iron_Lifter/profile.dart';
import 'package:iron_Lifter/reports.dart';
import 'package:iron_Lifter/editProfile.dart';
import 'package:iron_Lifter/signup.dart';
import 'adminPageMeetings.dart';
import 'history.dart';
import 'historysearch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iron Lifter',
      initialRoute: 'SignIn',
      routes: {
        'SignIn': (context) => SignInScreen(),
        'HomePage': (context) => HomePageScreen(),
        'SignUp': (context) => SignUpScreen(),
        'Profile': (context) => ProfileScreen(),
        'ProfileEdit': (context) => Editor(),
        'Reports': (context) => MedicalReports(),
        'AdminPageRequests': (context) => Adminpage(),
        'AdminPageMeetings': (context) => AdminpageMeetings(),
        'AdminReports': (context) => AdminReports(),
        'HistoryPage': (context) => History(),
        'HistorySearch': (context) => HistorySearch(),
        'BookingPage': (context) => BookConsultation(),
      },
    );
  }
}
