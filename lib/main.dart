import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:thesurvey/authentication/presentation/pages/signup.dart';
import 'package:thesurvey/pages/home_page.dart';
import 'package:thesurvey/pages/profile_page.dart';
import 'package:thesurvey/utils/fonts.dart';
import '../../../constants/values.dart';
import 'authentication/presentation/pages/login.dart';
import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  static const String KEY_LOGIN = "isLogin";
  static const String KEY_LOGIN_DETAILS = "authToken";

  final colorizeColors = [
  thirdColor,
  secondaryColor,
  thirdColor,
  fourthColor,
];

final colorizeTextStyle = TextStyle(color: Colors.black, fontSize: 17.5);

  @override
  void initState() {
    super.initState();

    // App Opening Control through Firebase realtime database
    

    logInPageSkip();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logoPath, height: 74),
              SizedBox(height: 14),
              AnimatedTextKit(
    animatedTexts: [
      ColorizeAnimatedText(
        'Surveys Simplified, Insights Amplified',
        textStyle: colorizeTextStyle,
        colors: colorizeColors,
      ),
      ColorizeAnimatedText(
        'Surveys Simplified, Insights Amplified',
        textStyle: colorizeTextStyle,
        colors: colorizeColors,
      ),
      ColorizeAnimatedText(
        'Surveys Simplified, Insights Amplified',
        textStyle: colorizeTextStyle,
        colors: colorizeColors,
      ),
    ],
    isRepeatingAnimation: true,
    onTap: () {
      print("Tap Event");
    },
  ),
            ],
          )),
      )
    );
  }

  void logInPageSkip() async {
    var shardPref = await SharedPreferences.getInstance();
    var isLoggedIn = shardPref.getBool(KEY_LOGIN);

    Timer(Duration(milliseconds: 2400), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                      )));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }
}